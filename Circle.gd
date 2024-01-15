extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _draw():
	draw_circle(Vector2(0, 0), 40.0, Color.green)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
