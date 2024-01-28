extends Node2D

var bullets_left: PackedScene = preload("res://scenes/enemy/bullet_right.tscn")

func _spawn():
	var bullet = bullets_left.instantiate()
	bullet.position = $Spawn.position
	add_child(bullet)
	$SpawnTimer.start()

func _ready():
	_spawn()

func _on_spawn_timer_timeout():
	_spawn()
