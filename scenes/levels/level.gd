extends Node2D

var dash_scene: PackedScene = preload("res://scenes/player/dash.tscn")
var blocks: PackedScene = preload("res://scenes/blocks/block_0.tscn")

func _on_player_dash_start():
	var dash = dash_scene.instantiate()
	dash.position = $Player.position
	$Projectiles.add_child(dash)


func _ready():
	var block: Array = []
	block.append(blocks.instantiate())
	block[0].position.y = -144
	$Blocks.add_child(block[0])
	for i in range(1, 10):
		block.append(blocks.instantiate())
		block[i].position.y = block[i - 1].position.y - 192
		$Blocks.add_child(block[i])
