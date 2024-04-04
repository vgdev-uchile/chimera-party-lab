extends HBoxContainer


@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $Label

var _player_data: PlayerData


func _ready() -> void:
	if _player_data:
		_update()


func setup(player_data: PlayerData) -> void:
	_player_data = player_data
	player_data.local_score_changed.connect(_update_score)


func _update():
	color_rect.color = _player_data.primary_color
	_update_score(_player_data.local_score)


func _update_score(value) -> void:
	label.text = str(value)
