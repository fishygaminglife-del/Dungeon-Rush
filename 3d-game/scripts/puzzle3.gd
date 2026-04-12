extends Node3D

var barrel1 = false
var barrel2 = false
var barrel3 = false
var started = 0
var finished = false
func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if finished == false:
		if $pressureplate2/MeshInstance3D2.get_surface_override_material(0).albedo_color == Color(0.405, 0.405, 0.405, 1.0) and $pressureplate1/MeshInstance3D1.get_surface_override_material(0).albedo_color == Color(0.405, 0.405, 0.405, 1.0) and $pressureplate3/MeshInstance3D3.get_surface_override_material(0).albedo_color == Color(0.405, 0.405, 0.405, 1.0):
			$"../TextPlayer/Textbox".visible = false
			$"../TextPlayer/Name".visible = false
			$"../TextPlayer/Text".visible = false
			$"../audio/wall move".play()
			$"../CanvasLayer".stop_puzzle()
			$"../MainScene".play("plate_finish")
			finished = true
			await $"../MainScene".animation_finished
			$"../audio/wall move".stop()
			
func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel2 = true
		$pressureplate2/MeshInstance3D2.get_surface_override_material(0).albedo_color = Color(0.405, 0.405, 0.405, 1.0)

func _on_area_3d_2_body_exited(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel2 = false
		$pressureplate2/MeshInstance3D2.get_surface_override_material(0).albedo_color = Color(1.0, 1.0, 1.0, 1.0)

func _on_area_3d_1_body_entered(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel1 = true
		$pressureplate1/MeshInstance3D1.get_surface_override_material(0).albedo_color = Color(0.405, 0.405, 0.405, 1.0)
func _on_area_3d_1_body_exited(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel1 = false
		$pressureplate1/MeshInstance3D1.get_surface_override_material(0).albedo_color = Color(1.0, 1.0, 1.0, 1.0)

func _on_area_3d_3_body_entered(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel3 = true
		$pressureplate3/MeshInstance3D3.get_surface_override_material(0).albedo_color = Color(0.405, 0.405, 0.405, 1.0)	
func _on_area_3d_3_body_exited(body: Node3D) -> void:
	if body.is_in_group("barrel") or body.is_in_group("player"):
		barrel3 = false
		$pressureplate3/MeshInstance3D3.get_surface_override_material(0).albedo_color = Color(1.0, 1.0, 1.0, 1.0)





func _on_close_body_entered(body: Node3D) -> void:
	if started == 0:
		$"../MainScene".play("barrel_enter")
		$"../TextPlayer/Text".text = "Push all the pressure plates down at once (use barrels and you!)"
		get_tree().get_root().get_node("Node3D/ProtoController").can_move = false
		get_tree().get_root().get_node("Node3D/ProtoController").velocity = Vector3.ZERO
		$"../audio/npctalk".play()
		$"../TextPlayer".play("textplay")
		await $"../TextPlayer".animation_finished
		$"../audio/npctalk".stop()
		$"../CanvasLayer".start_puzzle()
		$"../TextPlayer/Textbox".visible = false
		$"../TextPlayer/Name".visible = false
		$"../TextPlayer/Text".visible = false
		started = 1
