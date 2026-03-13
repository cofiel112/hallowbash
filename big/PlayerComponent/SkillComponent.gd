extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("skill"):
		if x_input == 1:
			velocity.y = 0
			velocity.x = 0
			velocity.x += dash_horizontal_speed
		if x_input == -1:
			velocity.y = 0
			velocity.x = 0
			velocity.x -= dash_horizontal_speed
		if y_input == -1:
			velocity.y = 0
			velocity.x = 0
			velocity.y += dash_vertical_speed
		if y_input == 1:
			velocity.y = 0
			velocity.x = 0
			velocity.y -= dash_vertical_speed
		if y_input == 0:
			if x_input == 0:
				if direction == 0:
					velocity.x -= dash_horizontal_speed
					print(_facing)
				else:
					velocity.x += dash_horizontal_speed
	pass
