extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_coinbody_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		Global.coins += 1
		$coinbody/CollisionShape3D.disabled = true
		$coin_stack.visible = false
		$"../../audio/coinpick".play()
