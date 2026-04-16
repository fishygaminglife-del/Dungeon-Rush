extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Button.visible = false

func _on_playbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/active instructions.tscn")


func _on_instructionsbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_creditbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credit.tscn")


func _on_button_2_pressed() -> void:
	$Button2.visible = false
	$Button.visible = true
	Global.volume = -80
func _on_button_pressed() -> void:
	$Button.visible = false
	$Button2.visible = true
	Global.volume = 0
