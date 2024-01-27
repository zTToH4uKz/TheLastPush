extends CharacterBody2D

var current_direction: Vector2 = Vector2.LEFT
var speed: int = 25
var is_dead: bool = false

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var raycast_left: RayCast2D = $RaycastLeft
@onready var raycast_right: RayCast2D = $RaycastRight

func _fly(delta):
	if current_direction == Vector2.LEFT and not is_dead:
		position.x -= speed * delta
		animation.play("fly_left")
	if current_direction == Vector2.RIGHT and not is_dead:
		position.x += speed * delta
		animation.play("fly_right")

func _fly_rotate():
	if raycast_left.is_colliding():
		current_direction = Vector2.RIGHT
		raycast_left.visible = false
		raycast_right.visible = true
	if raycast_right.is_colliding():
		current_direction = Vector2.LEFT
		raycast_left.visible = true
		raycast_right.visible = false
			

func _process(delta):
	_fly(delta)
	_fly_rotate()

func _on_area_2d_area_entered(_area):
	is_dead = true
	if current_direction == Vector2.LEFT:
		animation.play("death_left")
	if current_direction == Vector2.RIGHT:
		animation.play("death_right")
