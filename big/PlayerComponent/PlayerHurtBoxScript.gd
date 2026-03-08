class_name HurtBoxScript
extends Area2D

@export var damage := 10

func _init() -> void:
	collision_layer = 2
	collision_mask = 0

func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBoxScript) -> void:
	if hitbox == null:
		return
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
