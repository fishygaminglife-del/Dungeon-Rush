extends Node3D

var can_interact = false
var counts = 0

func _ready() -> void:
	$Building/StaticBody3D534.visible = false
	$Building/StaticBody3D535.visible = false
	$puzzle1/CODEE.visible = false
	$puzzle1/KeyPadZoom.visible = false
	$puzzle1/Panel1/CollisionShape3D.disabled = true
	$Npc1point.visible = false
	$NPCE.visible = false
	$puzzle1/CODEE.visible = false
	$Building/StaticCollision/CollisionShape3D6.position = Vector3(-6, 1.5, 11.8)
	$Building/StaticCollision.rotation_degrees = Vector3(0, 0, 0)
	$TextPlayer/Text.text = "Welcome to my first 3D Game, hope you enjoy it!"
	$TextPlayer.play("textplay")
	await $TextPlayer.animation_finished
	$TextPlayer/Textbox.visible = false
	$TextPlayer/Name.visible = false
	$TextPlayer/Text.visible = false
	$MainScene.play("door_open")
	await $MainScene.animation_finished
	$Npc1point.visible = true
	
func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		$NPCE.visible = false
		$Npc1point.visible = false
		if counts == 0:
			counts = 1
			$NPCTalk/CollisionShape3D.disabled = true
			$TextPlayer/Name.text = "Zombie"
			$TextPlayer/Text.text = "Howdy player, I am your guide today."
			$TextPlayer.play("textplay")
			await $TextPlayer.animation_finished
			$TextPlayer/Text.text = "Find the code in this room, and enter it on the code panel to proceed."
			$TextPlayer.play("text_play")
			await $TextPlayer.animation_finished			
			$TextPlayer/Textbox.visible = false
			$TextPlayer/Name.visible = false
			$TextPlayer/Text.visible = false
			$puzzle1/Panel1/CollisionShape3D.disabled = false
			$NPCTalk/CollisionShape3D.disabled = false
			can_interact = false
		elif can_interact == true and Global.key:
			$TextPlayer/Text.text = "Find the code in this room, and enter it on the code panel to proceed."
			$TextPlayer.play("text_play")
			await $TextPlayer.animation_finished			
			$TextPlayer/Textbox.visible = false
			$TextPlayer/Name.visible = false
			$TextPlayer/Text.visible = false
			$puzzle1/Panel1/CollisionShape3D.disabled = false
		elif Global.can_torch == true and can_interact:
			$TextPlayer/Text.text = "Find the code in this room, and light torches based on number order."
			$TextPlayer.play("text_play")
			await $TextPlayer.animation_finished			
			$TextPlayer/Textbox.visible = false
			$TextPlayer/Name.visible = false
			$TextPlayer/Text.visible = false
			$puzzle1/Panel1/CollisionShape3D.disabled = false
func _on_npc_talk_body_entered(body: Node3D) -> void:
	$NPCE.visible = true
	can_interact = true


func _on_npc_talk_body_exited(body: Node3D) -> void:
	$NPCE.visible = false
	can_interact = false


func _on_obby_3_darea_body_entered(body: Node3D) -> void:
	$MainScene.play("obby_reach")


func _on_area_3_dend_body_entered(body: Node3D) -> void:
	$TextPlayer/Text.text = "Wow, you finished the game you can leave (esc) or stay!"
	$TextPlayer.play("textplay")
	await $TextPlayer.animation_finished
	$TextPlayer/Textbox.visible = false
	$TextPlayer/Name.visible = false
	$TextPlayer/Text.visible = false
	$TextPlayer/Text.text = "You beat Dungeon Rush!"
	$TextPlayer/Name.text = "Zombie"
	$TextPlayer.play("textplay")
