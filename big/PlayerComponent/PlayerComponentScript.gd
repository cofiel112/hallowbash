extends CharacterBody2D
# Player stats.
var player_maxheart = 100
var player_maxmana = 100
var player_maxtension = 100

var player_attack = 1
var player_defense = 1
var player_magicattack = 1
var player_magicdefense = 1
var player_agility = 1
var player_luck = 1
# Config player movement.
var max_speed = 280
var acceleration = 10
var friction = 20
var horizontal_terminal_velocity = 500

var jump_speed = -500
var gravity = 1600
var vertical_terminal_velocity = 500

var wall_climb_toggle = 1
var wall_climbing_speed = -300

var dash_vertical_speed = 1000
var dash_horizontal_speed = 1000

@export var x_input_show: Label
@onready var player_hurt_box = %PlayerHurtbox
@onready var player_hit_box = %PlayerHitbox
# meowwwwwww


# Player input states.
var player_input_up = false
var player_input_left = false
var player_input_down = false
var player_input_right = false
var player_input_jump = false
var player_input_light = false
var player_input_medium = false
var player_input_heavy = false
var player_input_main_menu = false
var player_input_side_menu = false

@onready var buffer_timer: float = .1
var buffer:bool = false

@onready var coyote_timer = $CoyoteTimer

@onready var sprite_2d = $Sprite2D

# Starts this code at start.
func _ready():
	# Prints the message, "Hello World" in console.
	print("hello world")

func _physics_process(delta):
	## ATTACK
	if Input.is_action_just_pressed("attack"):
		attack()
	## JUMP
	if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				jump()
	# Add gravity every frame.
	velocity.y += gravity * delta
	# Adds a max amount of vertical velocity.
	if velocity.x > horizontal_terminal_velocity:
		velocity.x = horizontal_terminal_velocity
	if velocity.y > vertical_terminal_velocity:
		velocity.y = vertical_terminal_velocity
	# DEBUG: Prints Y Velocity in console when not on the floor
	if not is_on_floor():
		print("Y Velocity:", velocity.y)
		print(coyote_timer)
		print(position)
	## UP DOWN LEFT RIGHT
	# Move left or right.
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_input = Input.get_action_strength("up") - Input.get_action_strength("down")
	# Accelerate and deaccelerate, will determine if it goes up based on acceleration, or up based on friction.
	var velocity_weight = delta * (acceleration if Input.get_axis("left", "right") or Input.get_axis("right", "left")else friction)
	# Smooth velocity.x with velocity_weight, and move_speed only if there is x_input, since else it will be a 0.
	velocity.x = lerp(velocity.x, x_input * max_speed, velocity_weight)
	# Moves the player based on velocity, stops on collision,
	move_and_slide()
	# Flip sprite based on direction.
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var _facing = 0
	if direction > 0:
		_facing = 1
		sprite_2d.scale.x = 1
		player_hit_box.scale.x = 1
		player_hurt_box.scale.x = 1
	elif direction < 0:
		_facing = 0
		sprite_2d.scale.x = -1
		player_hit_box.scale.x = -1
		player_hurt_box.scale.x = -1
		
	
	## WALL CLIMB
	# WALL STAND
	if  Input.is_action_pressed("jump") && is_on_wall():
		if Input.is_action_pressed("left"):
			velocity.y = 0
		if Input.is_action_pressed("right"):
			velocity.y = 0
	# WALL WALK
	if Input.is_action_pressed("down") && Input.is_action_pressed("jump") && is_on_wall():
		velocity.y -= wall_climbing_speed
	if Input.is_action_pressed("up") && Input.is_action_pressed("jump") && is_on_wall():
		velocity.y += wall_climbing_speed
	
	## SKILL
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
# SKILL

## ATTACK
#makes it so the func attack works
@export var attacking = false
#allows animations for attacking to be played
@onready var animation = %AnimationPlayerThing
func jump():
	# Increases velocity by jump_speed variable.
	velocity.y = jump_speed
func attack():
	attacking = true
	if Engine.get_physics_frames() % 2 == 0:
		animation.play("Attack")

# debug console stuff
