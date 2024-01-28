extends Node2D

var default_direction: Vector2 = Vector2.LEFT
var speed: int = 45

func _process(delta):
	position += speed * delta * default_direction

func _on_area_2d_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()
