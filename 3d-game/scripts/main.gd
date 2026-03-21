extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer/Text.text = "Welcome to my first 3D Game"
	$AnimationPlayer.play("textplay")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer/Textbox.visible = false
	$AnimationPlayer/Name.visible = false
	$AnimationPlayer/Text.visible = false
