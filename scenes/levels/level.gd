extends Node2D

var dash_scene: PackedScene = preload("res://scenes/player/dash.tscn")
var blocks: Array = [
	preload("res://scenes/blocks/block_0.tscn"),
	preload("res://scenes/blocks/block_1.tscn"),
	preload("res://scenes/blocks/block_2.tscn"),
	preload("res://scenes/blocks/block_3.tscn"),
	preload("res://scenes/blocks/block_4.tscn"),
	preload("res://scenes/blocks/block_5.tscn"),
]

var is_gen: bool = true
var block
var blocks_gen: Array
var latest_block

signal change_timer

func _on_player_dash_start():
	var dash = dash_scene.instantiate()
	dash.position = $Player.position
	$Projectiles.add_child(dash)

func _ready():
	block = blocks[randi() % blocks.size()].instantiate()
	$Blocks.add_child(block)
	block.position.y = -144
	latest_block = block

func _add_block():
	var local_block = blocks[randi() % blocks.size()].instantiate()
	blocks_gen.append(blocks[randi() % blocks.size()].instantiate())
	$Blocks.add_child(local_block)
	local_block.position.y = latest_block.position.y -192
	latest_block = local_block

func _process(delta):
	if is_gen:
		is_gen = false
		_add_block()
		_add_block()
	Globals.all_time -= delta
	change_timer.emit()
	if Globals.all_time <= 0:
		$PauseMenu.restart()
		
	if Input.is_action_pressed("pause"):
		$PauseMenu.pause()
		
func _del_block():
	$Blocks.get_child(0).delete()

func _on_camera_2d_change_gen():
	print("Change")
	_del_block()
	is_gen = true
