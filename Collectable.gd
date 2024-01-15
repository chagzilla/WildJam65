extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_area_entered")

func _on_area_entered(area):
	print(area.name)
	if area.name == "Player":
		area.points += 2
		get_parent().queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
