extends "res://ui_lab/settings/line_edit_dialog.gd"


func _on_confirmed() -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	game_info.name = line_edit.text
	ResourceSaver.save(game_info, Game.get_current_game_path() + "/info.tres")


func _on_canceled() -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	line_edit.text = game_info.name
