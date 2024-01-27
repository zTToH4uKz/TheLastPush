extends Camera2D

@export var random_strength: float = 4
@export var shake_fade: float = 5.0

var rnd = RandomNumberGenerator.new()
var shake_strength: float = 0.0

@onready var player: CharacterBody2D = $"../Player"

signal change_gen

func apply_shake():
	shake_strength = random_strength
	
func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		offset = random_offset()
	if player.position.y < position.y:
		position = Vector2(0, player.position.y)
	if $"../Blocks".get_child(0).position.y - 300 > position.y:
		change_gen.emit()
	
func random_offset() -> Vector2:
	return Vector2(rnd.randf_range(-shake_strength, shake_strength), rnd.randf_range(-shake_strength, shake_strength))

func _on_player_shake_start():
	apply_shake()
