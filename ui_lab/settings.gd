extends Control

@onready var back: Button = %Back

func _ready() -> void:
	back.pressed.connect(func(): get_tree().change_scene_to_file("res://ui_lab/main_menu.tscn"))
	back.grab_focus()


