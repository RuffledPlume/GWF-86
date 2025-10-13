class_name Player extends Character

func _physics_process(delta: float) -> void:
	var movement_input : Vector3
	if Input.is_key_pressed(KEY_D):
		movement_input.x = 1.0
	elif Input.is_key_pressed(KEY_A):
		movement_input.x = -1.0
	
	if Input.is_key_pressed(KEY_W):
		movement_input.z = 1.0
	elif Input.is_key_pressed(KEY_S):
		movement_input.z = -1.0
		
	velocity = movement_input * 100.0 * delta
	
	move_and_slide()
