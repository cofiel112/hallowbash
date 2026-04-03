extends Node2D
var player_position = position
var instance = thenode
@export var thenode = preload("res://big/BoxComponent/box.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func inst(pos):
	var instance = thenode.instantiate()
	instance.player_position = pos
	add_child(instance)
func uninst(pos):
	var instance = thenode.instantiate()
	instance.player_position = pos
	remove_child(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_submit"):
		inst(get_global_mouse_position)
	if Input.is_action_just_pressed("ui_cancel"):
		free()
		
	pass
