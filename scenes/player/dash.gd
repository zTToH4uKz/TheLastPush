extends Node2D

var speed: int = 350

func _ready():
	anim_start()
	$Timer.start()

func _process(delta):
	position.y += speed * delta

func anim_start():
	$AnimationPlayer.play("dash_down")

func _on_timer_timeout():
	queue_free()
