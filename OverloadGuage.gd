extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100
var containerHeight = 0;
var origin = Vector2(0, 0)
var player
var timer: Timer
var isCrazyColorsOn: bool
var colorIndex: int
var colorArr = [Color.red, Color.green, Color.yellow, Color.blue]


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	colorIndex = 0
	isCrazyColorsOn = false
	player = get_parent().get_parent().get_parent()
	containerHeight = get_parent().get_node("Container").rect_size.y
	self.color = Color(1, 1, 0 , 0.5)
	self.rect_min_size = Vector2(36, 0)
	self.rect_size = Vector2(36, 0)
	self.rect_position = Vector2(self.rect_position.x, self.rect_position.y + 40)
	origin = self.rect_position
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = 0.05 # 1 second
	timer.autostart = false
	timer.start()

func _on_timer_timeout() -> void:
	colorIndex = (colorIndex + 1) % colorArr.size()
	self.color = colorArr[colorIndex]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.points = min(max(0, player.points - delta), 100)
	var percentage = player.points / 100
	if percentage <= 0.9:
		self.color = Color.green.linear_interpolate(Color.red, percentage)
		isCrazyColorsOn = false
		timer.stop()
	elif percentage > 0.9 and not isCrazyColorsOn:
		isCrazyColorsOn = true
		timer.start()
	self.rect_size = Vector2(self.rect_size.x, percentage * containerHeight)
	self.rect_position = Vector2(self.rect_position.x, origin.y - percentage * containerHeight)
	#if self.rect_size.y + speed * delta >= containerHeight:
	#	self.rect_size = Vector2(self.rect_size.x, containerHeight)
	#else:
	#	self.rect_size = Vector2(self.rect_size.x, self.rect_size.y + speed * delta)
	#	self.rect_position = Vector2(self.rect_position.x, self.rect_position.y - speed * delta)
 
