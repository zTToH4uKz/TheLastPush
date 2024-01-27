extends Node2D

var dash_scene: PackedScene = preload("res://scenes/player/dash.tscn")
var blocks: Array = [
	preload("res://scenes/blocks/block_0.tscn"),
	preload("res://scenes/blocks/block_1.tscn"),
	preload("res://scenes/blocks/block_2.tscn")
]

@onready var gen_timer = $Blocks/GenTimer
@onready var del_timer = $Blocks/DelTimer

var is_gen: bool = true
var block
var blocks_gen: Array
var latest_block

func _on_player_dash_start():
	var dash = dash_scene.instantiate()
	dash.position = $Player.position
	$Projectiles.add_child(dash)

func _ready():
	block = blocks[randi() % blocks.size()].instantiate()
	$Blocks.add_child(block)
	block.position.y = -144
	latest_block = block

func _process(_delta):
	if is_gen:
		is_gen = false
		var local_block = blocks[randi() % blocks.size()].instantiate()
		blocks_gen.append(blocks[randi() % blocks.size()].instantiate())
		$Blocks.add_child(local_block)
		local_block.position.y = latest_block.position.y -192
		latest_block = local_block
		del_timer.start()
		gen_timer.start()

func _on_gen_timer_timeout():
	is_gen = true

func _on_del_timer_timeout():
	$Blocks.get_child(2).delete()
