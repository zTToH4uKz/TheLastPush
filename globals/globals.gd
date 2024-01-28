extends Node

var array_baf: Array = [
	7.0,
	-5.0
]

var baf_value_hit = 0
var baf_add_max_value = 0

var death_bird: int = 0
var death_bird_record: int = 0

var time_board: float = 0
var time_board_record: float = 0

var array_baf_hit: Array = [
	2.0,
	-1.0
]

var current_baf: float = 0
var hit_value: float = 5

var max_value: float = 25.0

var all_time: float = 25.0:
	set(value):
		all_time = value

func set_default():
	all_time = 25.0
	hit_value = 5
	max_value = 25.0
	if death_bird_record < death_bird:
		death_bird_record = death_bird
	if time_board_record < time_board:
		time_board_record = time_board
	time_board = 0
	death_bird = 0
