extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_playbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_instructionsbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_creditbut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credit.tscn")
