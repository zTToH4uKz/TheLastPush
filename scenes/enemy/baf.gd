extends Node2D

func _on_area_2d_body_entered(_body):
	Globals.max_value += Globals.array_baf[randi() % Globals.array_baf.size()]
	Globals.hit_value += Globals.array_baf_hit[randi() % Globals.array_baf_hit.size()]
	print(Globals.hit_value)
	queue_free()
