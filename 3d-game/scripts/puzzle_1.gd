extends Node3D


var code_input: Array = []
var code = int(str(randi_range(1, 9)) + str(randi_range(1, 9)) + str(randi_range(1, 9)))
var correct_code = str(code)
var label = randi_range(1, 6)
var labpicked = null


func _ready() -> void:
	$KeyPadZoom/CodeSHow.text = ""
	if label == 1:
		$Wall1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Wall1
	elif label == 2:
		$Pillar1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Pillar1
	elif label == 3:
		$Chair1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Chair1
	elif label == 4:
		$Barrel1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Barrel1
	elif label == 5:
		$Side1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Side1
	elif label == 6:
		$Back1.text = correct_code
		$Pillar1.visible = false
		$Chair1.visible = false
		$Barrel1.visible = false
		$Wall1.visible = false
		$Back1.visible = false
		$Side1.visible = false
		labpicked = $Back1
func _input(event):
	if event.is_action_pressed("interact") and Global.keypad == true:
		$KeyPadZoom.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../TextPlayer/Textbox".visible = false
		$"../TextPlayer/Name".visible = false
		$"../TextPlayer/Text".visible = false
	elif event.is_action_pressed("interact") and Global.keypad == false:
		$KeyPadZoom.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
func _on_panel_1_body_entered(body: Node3D) -> void:
	Global.keypad = true
	$CODEE.visible = true
func _on_panel_1_body_exited(body: Node3D) -> void:
	Global.keypad = false
	$CODEE.visible = false	
func add_number(num):
	code_input.append(num)
	$KeyPadZoom/CodeSHow.text =  "".join(code_input.map(str))
	if code_input.size() == 3:
		check_code()
		
func check_code():   
	if "".join(code_input.map(str)) == correct_code:
		$"../CanvasLayer".stop_puzzle()
		$"../audio/dooropen".play()
		$"../MainScene".play("door_open2")
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$KeyPadZoom.visible = false
		Global.keypad = false
		Global.can_torch = true
		$CODEE.visible = false
		await $"../MainScene".animation_finished
		$"../audio/dooropen".stop()		
	else:
		code_input.clear()
		$KeyPadZoom/CodeSHow.text =  ""
func _on_close_pressed() -> void:
	$KeyPadZoom.visible = false
	code_input = []
	$KeyPadZoom/CodeSHow.text = ""
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_b_1_pressed() -> void:
	add_number(1)
func _on_b_2_pressed() -> void:
	add_number(2)
func _on_b_3_pressed() -> void:
	add_number(3)
func _on_b_4_pressed() -> void:
	add_number(4)
func _on_b_5_pressed() -> void:
	add_number(5)
func _on_b_6_pressed() -> void:
	add_number(6)
func _on_b_7_pressed() -> void:
	add_number(7)
func _on_b_8_pressed() -> void:
	add_number(8)
func _on_b_9_pressed() -> void:
	add_number(9)
