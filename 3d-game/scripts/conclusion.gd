extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label4.text = str(Global.coins)



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/homescreen.tscn")
