extends Node3D

var barrel1 = false
var barrel2 = false
var barrel3 = false
var started = 0

func _ready() -> void:
	pass 




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


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if started == 0:
			started = 1
			$"../MainScene".play("barrel_enter")
			$"../TextPlayer/Name".text = "Zombie"
			$"../TextPlayer/Text".text = "Activate each pressure plate to continue."
			$"../TextPlayer".play("textplay")
			await $"../TextPlayer".animation_finished
