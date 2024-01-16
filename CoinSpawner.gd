extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Coin = preload("res://Collectible.tscn")
var timer: Timer
signal spawn_coin(coin)
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = 1 # 1 second
	timer.autostart = false
	timer.start()

func _on_timer_timeout() -> void:
	emit_signal("spawn_coin", Coin)
#	var spawned_coin = Coin.instance()
#	add_child(spawned_coin)
#	spawned_coin.position = Vector2(0, 0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
