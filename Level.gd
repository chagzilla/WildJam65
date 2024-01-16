extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng: RandomNumberGenerator
# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	$Player.connect("shoot", self, "_on_player_shoot")
	$CoinSpawner.connect("spawn_coin", self, "_on_spawn_coin")
	#pass # Replace with function body.

func _on_spawn_coin(Coin):
	var spawned_coin = Coin.instance()
	# spawned_coin.local_to_scene = true
	add_child(spawned_coin)
	var angle = (rng.randf_range(0.0, 360.0) * PI) / 180.0
	var vector_pos = Vector2(cos(angle), sin(angle))
	var radius = rng.randf_range(0.0, 200.0)
	spawned_coin.position = vector_pos * radius
	spawned_coin.set_radius(rng.randf_range(5.0, 50.0))

func _on_player_shoot(Bullet, direction, location):
	var spawned_bullet = Bullet.instance()
	add_child(spawned_bullet)
	spawned_bullet.direction = direction
	spawned_bullet.position = location
	#spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
