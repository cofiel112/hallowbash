extends Node2D

var thenode = preload("res://big/PlayerComponent/player_component.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func inst(pos):
	var instance = thenode.instantiate()
	instance.player_position = pos
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		inst(get_global_mouse_position)
		
	pass
