extends Node2D

var radius = 10.0
var rng: RandomNumberGenerator
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _draw():
	draw_circle(Vector2(0, 0), radius, Color.green)
	
func set_radius(r):
	radius = r
	$Area2D/CollisionShape2D.get_shape().radius = radius
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	radius += 1
#	pass
