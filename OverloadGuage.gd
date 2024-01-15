extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100
var containerHeight = 0;
var origin = Vector2(0, 0)



# Called when the node enters the scene tree for the first time.
func _ready():
	containerHeight = get_parent().get_node("Container").rect_size.y
	self.color = Color(1, 1, 0 , 0.5)
	self.rect_min_size = Vector2(36, 0)
	self.rect_size = Vector2(36, 0)
	self.rect_position = Vector2(self.rect_position.x, self.rect_position.y + 40)
	origin = self.rect_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overloadPoints = get_parent().get_parent().get_parent().points
	var percentage = min(overloadPoints/20.0, 1)
	self.rect_size = Vector2(self.rect_size.x, percentage * containerHeight)
	self.rect_position = Vector2(self.rect_position.x, origin.y - percentage * containerHeight)
	#if self.rect_size.y + speed * delta >= containerHeight:
	#	self.rect_size = Vector2(self.rect_size.x, containerHeight)
	#else:
	#	self.rect_size = Vector2(self.rect_size.x, self.rect_size.y + speed * delta)
	#	self.rect_position = Vector2(self.rect_position.x, self.rect_position.y - speed * delta)
 
