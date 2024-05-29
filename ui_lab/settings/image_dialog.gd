extends FileDialog


func _ready() -> void:
	file_selected.connect(_on_file_selected)


func _on_file_selected(path: String) -> void:
	Debug.log(path)
	var game_info = Game.get_current_game_info() as GameInfo
	var image = load(path)
	if image is Texture2D:
		game_info.image = load(path)
		ResourceSaver.save(game_info, Game.get_current_game_path() + "/info.tres")
