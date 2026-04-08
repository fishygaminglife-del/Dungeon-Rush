extends RigidBody3D

func _on_body_entered(body):
	if body.is_in_group("player"):
		var direction = (global_position - body.global_position).normalized()
		apply_central_impulse(direction * 2)
