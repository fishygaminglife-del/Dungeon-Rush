extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_playbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/active instructions.tscn")


func _on_instructionsbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_creditbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credit.tscn")
