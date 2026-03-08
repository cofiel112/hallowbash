extends CharacterBody2D
class_name JumpComponent

## JUMP
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				jump()
	move_and_slide()
	var gravity = 1600
	velocity.y += gravity * delta
func jump():
	var jump_speed = -500
	# Increases velocity by jump_speed variable.
	velocity.y = jump_speed
