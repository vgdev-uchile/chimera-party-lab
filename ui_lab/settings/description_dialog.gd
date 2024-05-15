extends ConfirmationDialog

@onready var text_edit: TextEdit = %TextEdit
@onready var rich_text_label: RichTextLabel = %RichTextLabel


func _ready() -> void:
	text_edit.text_changed.connect(_on_text_changed)
	confirmed.connect(_on_confirmed)
	canceled.connect(_on_canceled)
	
	_on_canceled()


func _on_text_changed() -> void:
	rich_text_label.text = text_edit.text


func _on_confirmed() -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	game_info.description = text_edit.text
	ResourceSaver.save(game_info, Game.get_current_game_path() + "/info.tres")


func _on_canceled() -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	text_edit.text = game_info.description
	_on_text_changed()
