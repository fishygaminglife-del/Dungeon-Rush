extends Node2D
var pressed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Screenshot20260410184731.visible = false
	$Screenshot20260410215519.visible = false
	$Label4.text = "Move with WASD or Arrow Keys | Look around with the Mouse | Jump with Spacebar."
	$Label3.text = "Collect coins scattered around the map to grow your coin balance!"
	$Label2.text = "Each puzzle has a timer (top-right corner) solve it fast to earn more coins! Under 15s = 5 coins  |  Under 30s = 3 coins  |  Under 60s = 2 coins."
	$InstructionPlayer.play("textplay_start")
	

func _on_continue_pressed() -> void:
	if pressed == 0:
		pressed = 1
		$InstructionPlayer.play("textplay_end")
		$Label3.text = ""
		$Label2.text = ""
		$Label4.text = "Coins and Timer\n ⬅️Press Continue to Start➡️"
		$InstructionPlayer.play("textplay_start")
		$Screenshot20260410184731.visible = true
		$Screenshot20260410215519.visible = true
		$AnimationPlayer.play("imageplay")
	else:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
