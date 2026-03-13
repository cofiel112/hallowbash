extends CharacterBody2D
func _physics_process(delta: float) -> void:
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_input = Input.get_action_strength("up") - Input.get_action_strength("down")
	var dash_horizontal_speed = 400
	var dash_vertical_speed = 400
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var _facing = 0
	
