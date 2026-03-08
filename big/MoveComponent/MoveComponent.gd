extends CharacterBody2D
class_name MoveComponent

func _physics_process(delta):
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_input = Input.get_action_strength("up") - Input.get_action_strength("down")
	# Accelerate and deaccelerate, will determine if it goes up based on acceleration, or up based on friction.
	var max_speed = 280
	var acceleration = 10
	var friction = 20
	var velocity_weight = delta * (acceleration if Input.get_axis("left", "right") or Input.get_axis("right", "left")else friction)
	# Smooth velocity.x with velocity_weight, and move_speed only if there is x_input, since else it will be a 0.
	velocity.x = lerp(velocity.x, x_input * max_speed, velocity_weight)
	move_and_slide()
