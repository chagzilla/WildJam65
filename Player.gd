extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0, 0)
var viewDir = Vector2(0, 0)
var points = 0
var Bullet = preload("res://Bullet.tscn")
export var speed = 10
signal shoot(bullet, viewDir, location)

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		viewDir = (get_global_mouse_position() - self.position).normalized()
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			emit_signal("shoot", Bullet, viewDir, self.position + (viewDir * 5))
		# shoot.emit(Bullet, event.position)
		# pass
	
   # Print the size of the viewport.
   # print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)


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

