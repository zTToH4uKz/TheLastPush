extends Node2D

func _on_area_2d_body_entered(_body):
	var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
	audio.play()
	$Timer.start()

func _on_timer_timeout():
	Globals.max_value += Globals.array_baf[randi() % Globals.array_baf.size()]
	Globals.hit_value += Globals.array_baf_hit[randi() % Globals.array_baf_hit.size()]
	print(Globals.hit_value)
	queue_free()
