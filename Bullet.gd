extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300.0
var direction = Vector2(1, 0)

func _draw():
	draw_circle(Vector2(0, 0), 10.0, Color.blueviolet)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += direction * speed * delta 	
#	pass
