extends VBoxContainer

@onready var _1v_1: CheckBox = %"1v1"
@onready var _1v_2: CheckBox = %"1v2"
@onready var _1v_3: CheckBox = %"1v3"
@onready var _2v_2: CheckBox = %"2v2"
@onready var _ffa: CheckBox = %FFA

func _ready() -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	_1v_1.button_pressed = game_info.modes & 1 << 0
	_1v_2.button_pressed = game_info.modes & 1 << 1
	_1v_3.button_pressed = game_info.modes & 1 << 2
	_2v_2.button_pressed = game_info.modes & 1 << 3
	_ffa.button_pressed = game_info.modes & 1 << 4
	
	_1v_1.toggled.connect(func(toggled_on): _on_toggled(toggled_on, 1 << 0))
	_1v_2.toggled.connect(func(toggled_on): _on_toggled(toggled_on, 1 << 1))
	_1v_3.toggled.connect(func(toggled_on): _on_toggled(toggled_on, 1 << 2))
	_2v_2.toggled.connect(func(toggled_on): _on_toggled(toggled_on, 1 << 3))
	_ffa.toggled.connect(func(toggled_on): _on_toggled(toggled_on, 1 << 4))


func _on_toggled(toggled_on: bool, value: int) -> void:
	var game_info = Game.get_current_game_info() as GameInfo
	if game_info.modes & value:
		if not toggled_on:
			game_info.modes -= value
	else:
		if toggled_on:
			game_info.modes += value
	ResourceSaver.save(game_info, Game.get_current_game_path() + "/info.tres")
