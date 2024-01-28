extends CanvasLayer

func _ready():
	hide()

func pause():
	$BirdBoard/Label.text = "Record Kill Bird - " + str(Globals.death_bird_record)
	$TimeBoard/Label.text = "Record Lifetime - %.2fs" % [Globals.time_board_record]
	get_tree().paused = true
	show()

func _on_continue_pressed():
	hide()
	get_tree().paused = false

func restart():
	Globals.set_default()
	get_tree().change_scene_to_file("res://scenes/levels/level.tscn")

func _on_restart_pressed():
	hide()
	get_tree().paused = false
	restart()
