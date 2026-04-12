extends Node3D

var can_interact = false
var counts = 0
func _ready() -> void:
	#total coins user can get is 41
	$ProtoController.position = Vector3(-5.97, 0.56, 16.45)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
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
	$audio/dooropen.play()
	$MainScene.play("door_open")
	await $MainScene.animation_finished
	$audio/dooropen.stop()
	$Npc1point.visible = true
	
func _process(delta: float) -> void:
	$Label.text = str(Global.coins)
func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		$NPCE.visible = false
		$Npc1point.visible = false
		if counts == 0:
			counts = 1
			$NPCTalk/CollisionShape3D.disabled = true
			get_tree().get_root().get_node("Node3D/ProtoController").can_move = false
			get_tree().get_root().get_node("Node3D/ProtoController").velocity = Vector3.ZERO
			$TextPlayer/Name.text = "Zombie"
			$TextPlayer/Text.text = "Howdy player, I am your guide today."
			$audio/npctalk.play()
			$TextPlayer.play("textplay")
			await $TextPlayer.animation_finished
			$audio/npctalk.stop()
			$TextPlayer/Text.text = "Find the code in this room, and enter it on the code panel to proceed."
			$TextPlayer.play("text_play")
			$audio/npctalk.play()
			await $TextPlayer.animation_finished
			$audio/npctalk.stop()	
			$TextPlayer/Textbox.visible = false
			$TextPlayer/Name.visible = false
			$TextPlayer/Text.visible = false
			$puzzle1/Panel1/CollisionShape3D.disabled = false
			$NPCTalk/CollisionShape3D.disabled = false
			$CanvasLayer.start_puzzle()
			await get_tree().create_timer(3).timeout
			$puzzle1.labpicked.visible = true
			can_interact = false
		elif can_interact == true and Global.key:
			
			$TextPlayer/Text.text = "Find the code in this room, and enter it on the code panel to proceed."
			$TextPlayer.play("text_play")
			$audio/npctalk.play()
			await $TextPlayer.animation_finished
			$audio/npctalk.stop()
			$TextPlayer/Textbox.visible = false
			$TextPlayer/Name.visible = false
			$TextPlayer/Text.visible = false
			$puzzle1/Panel1/CollisionShape3D.disabled = false
		elif Global.can_torch == true and can_interact:
			$TextPlayer/Text.text = "Find the code in this room, and light torches based on number order."
			$TextPlayer.play("text_play")
			await $TextPlayer.animation_finished
			$audio/npctalk.stop()
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
	$"audio/wall move".play()
	$MainScene.play("obby_reach")
	await $MainScene.animation_finished
	$"audio/wall move".stop()

func _on_area_3_dend_body_entered(body: Node3D) -> void:
	$CanvasLayer.stop_puzzle()
	$TextPlayer/Text.text = "Wow, you found me, you can leave (esc) or continue!"
	$TextPlayer.play("textplay")
	$audio/npctalk.play()
	await $TextPlayer.animation_finished
	$audio/npctalk.stop()
	$TextPlayer/Textbox.visible = false
	$TextPlayer/Name.visible = false
	$TextPlayer/Text.visible = false


func _on_obbyenter_body_entered(body: Node3D) -> void:
	$MainScene.play("obby_show")
	$TextPlayer/Text.text = "Reach the top (complete the obby)"
	$TextPlayer.play("textplay")
	$audio/npctalk.play()
	await $TextPlayer.animation_finished
	$"audio/npctalk".stop()
	$"TextPlayer/Textbox".visible = false
	$"TextPlayer/Name".visible = false
	$"TextPlayer/Text".visible = false
	await $MainScene.animation_finished
	$CanvasLayer.start_puzzle()


func _on_maze_talk_body_entered(body: Node3D) -> void:
	get_tree().get_root().get_node("Node3D/ProtoController").can_move = false
	get_tree().get_root().get_node("Node3D/ProtoController").velocity = Vector3.ZERO
	$TextPlayer/Text.text = "You thought that was the end, find the exit of the maze."
	$TextPlayer.play("textplay")
	$audio/npctalk.play()
	await $TextPlayer.animation_finished
	$audio/npctalk.stop()
	$CanvasLayer.start_puzzle()

func _on_end_talk_body_entered(body: Node3D) -> void:
	$CanvasLayer.stop_puzzle()
	$TextPlayer/Name.text = "Malgosha"
	$TextPlayer/Text.text = "Wow, you found me. I have been so lost, and now you saved me! "
	$TextPlayer.play("textplay")
	await $TextPlayer.animation_finished
	$TextPlayer/Textbox.visible = false
	$TextPlayer/Name.visible = false
	$TextPlayer/Text.visible = false
