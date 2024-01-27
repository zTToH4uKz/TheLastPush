extends Node2D

var speed: int = 350

func _process(delta):
	position.y += speed * delta
	anim_start()

func anim_start():
	$AnimationPlayer.play("dash_down")
