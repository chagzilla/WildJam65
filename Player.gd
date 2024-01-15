extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0, 0)
var points = 0
export var speed = 10

func get_input():
	var input_direction = Vector2(0, 0)
	if Input.is_action_pressed("ui_right"):
		input_direction.x += 1
	if Input.is_action_pressed("ui_left"):
		input_direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		input_direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_direction.y += 1
	velocity = input_direction * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	self.position += velocity * delta

