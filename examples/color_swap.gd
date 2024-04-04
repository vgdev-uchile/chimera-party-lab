extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	update_color()


func update_color() -> void:
	if Game.test_players.size():
		sprite_2d.material.set_shader_parameter("to", Game.test_players[0].color)
