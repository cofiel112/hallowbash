extends CharacterBody2D
## 1 Player stats.
var player_maxheart = 100
var player_maxmana = 100
var player_maxtension = 100

var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
var y_input = Input.get_action_strength("up") - Input.get_action_strength("down")
var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
var _facing = 0

var player_position = position
var player_attack = 1
var player_defense = 1
var player_magicattack = 1
var player_magicdefense = 1
var player_agility = 1
var player_luck = 1
## 2 Config player movement.
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

## ? Player input states.
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
