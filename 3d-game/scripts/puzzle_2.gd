extends Node3D


var cur_torch = 0
var cur_code = ""
var correct_order = [1, 2, 3, 4]
var code_shuffled = ""
var code_input = []
var t_1 = 0
var t_2 = 0
var t_3 = 0
var t_4 = 0
var puz2 = true
func _ready() -> void:
	correct_order.shuffle()
	code_shuffled =  "".join(correct_order.map(str))
	$CodeWall.text = code_shuffled
	$StaticBody3D/OmniLight3D2.visible = false
	$StaticBody3D2/OmniLight3D2.visible = false
	$StaticBody3D3/OmniLight3D2.visible = false
	$StaticBody3D4/OmniLight3D2.visible = false
	$TrigerT1/Torch1.visible = false
	$TrigerT2/Torch2.visible = false
	$TrigerT3/Torch3.visible = false
	$TrigerT4/Torch4.visible = false
func _input(event):
	if event.is_action_pressed("interact") and Global.can_torch == true:
		if cur_torch == 1:
			cur_torch = 0
			$TrigerT1/Torch1.visible = false
			$StaticBody3D/OmniLight3D2.visible = true
			add_number(1)
		elif cur_torch == 2:
			cur_torch = 0
			$TrigerT2/Torch2.visible = false
			$StaticBody3D2/OmniLight3D2.visible = true
			add_number(2)
		elif cur_torch == 3:
			cur_torch = 0
			$TrigerT3/Torch3.visible = false
			$StaticBody3D3/OmniLight3D2.visible = true
			add_number(3)
		elif cur_torch == 4:
			cur_torch = 0
			$TrigerT4/Torch4.visible = false
			$StaticBody3D4/OmniLight3D2.visible = true
			add_number(4)
func add_number(num):
	code_input.append(num)
	$"../puzzle1/CODEE".visible = false
	Global.keypad = false
	if code_input.size() == 4:
		if code_input == correct_order:
			$"../MainScene".play("code_correct")
			await $"../MainScene".animation_finished
			$"../TextPlayer/Text".text = "Push all the pressure plates down at once (use barrels and you!)"
			$"../TextPlayer".play("textplay")
			await get_tree().create_timer(7).timeout
			$"../TextPlayer/Textbox".visible = false
			$"../TextPlayer/Name".visible = false
			$"../TextPlayer/Text".visible = false
		else:
			$StaticBody3D/OmniLight3D2.visible = false
			$StaticBody3D2/OmniLight3D2.visible = false
			$StaticBody3D3/OmniLight3D2.visible = false
			$StaticBody3D4/OmniLight3D2.visible = false
			$"../ProtoController".position = Vector3(-2.2, 3, -16.7)
			code_input.clear()
			cur_torch = 0
			t_1 = 0
			t_2 = 0
			t_3 = 0
			t_4 = 0
			
func _on_triger_t_1_body_entered(body: Node3D) -> void:
	Global.can_torch = true
	if t_1 == 0:
		if $StaticBody3D/OmniLight3D2.visible == true:
			t_1 = 1
		else:
			cur_torch = 1
			$TrigerT1/Torch1.visible = true
func _on_triger_t_1_body_exited(body: Node3D) -> void:
		$TrigerT1/Torch1.visible = false
		cur_torch = 0
func _on_triger_t_2_body_entered(body: Node3D) -> void:
	Global.can_torch = true
	if t_2 == 0:
		if $StaticBody3D2/OmniLight3D2.visible == true:
			t_2 = 1
		else:
			cur_torch = 2
			$TrigerT2/Torch2.visible = true
func _on_triger_t_2_body_exited(body: Node3D) -> void:
	cur_torch = 0
	$TrigerT2/Torch2.visible = false
func _on_triger_t_3_body_entered(body: Node3D) -> void:
	Global.can_torch = true
	if t_3 == 0:
		if $StaticBody3D3/OmniLight3D2.visible == true:
			t_3 = 1
		else:
			cur_torch = 3
			$TrigerT3/Torch3.visible = true
func _on_triger_t_3_body_exited(body: Node3D) -> void:
	cur_torch = 0
	$TrigerT3/Torch3.visible = false
func _on_triger_t_4_body_entered(body: Node3D) -> void:
	Global.can_torch = true
	if t_4 == 0:
		if $StaticBody3D4/OmniLight3D2.visible == true:
			t_4 = 1
		else:
			cur_torch = 4
			$TrigerT4/Torch4.visible = true
func _on_triger_t_4_body_exited(body: Node3D) -> void:
	cur_torch = 0
	$TrigerT4/Torch4.visible = false


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and puz2:
			Global.key = false
			puz2 = false
			$"../TextPlayer/Text".text = "Find the code in this room, and light torches based on number order."
			$"../TextPlayer".play("text_play")
			await $"../TextPlayer".animation_finished			
			$"../TextPlayer/Textbox".visible = false
			$"../TextPlayer/Name".visible = false
			$"../TextPlayer/Text".visible = false 
