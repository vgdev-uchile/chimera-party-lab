extends ConfirmationDialog

@export var input_info_scene: PackedScene

@onready var input_infos_container: VBoxContainer = %InputInfosContainer
@onready var add_input: Button = %AddInput


func _ready() -> void:
	confirmed.connect(_on_confirmed)
	canceled.connect(_on_canceled)
	add_input.pressed.connect(func(): _create_input_info())
	
	_on_canceled()


func _on_confirmed() -> void:
	var game_info = Game.get_current_game_info() as GameInfo	
	var inputs: Array[GameInput] = []
	for child in input_infos_container.get_children():
		inputs.append(child.get_input())
	game_info.inputs = inputs
	ResourceSaver.save(game_info, Game.get_current_game_path() + "/info.tres")


func _on_canceled() -> void:
	for child in input_infos_container.get_children():
		input_infos_container.remove_child(child)
		child.queue_free()
	var game_info = Game.get_current_game_info() as GameInfo
	if not game_info or not input_info_scene:
		return
	for input in game_info.inputs:
		var input_info_inst = _create_input_info()
		input_info_inst.update(input)


func _on_input_delete_pressed(input_info) -> void:
	input_infos_container.remove_child(input_info)
	input_info.queue_free()
	size.y = min_size.y


func _create_input_info():
	var input_info_inst = input_info_scene.instantiate()
	input_infos_container.add_child(input_info_inst)
	input_info_inst.delete_pressed.connect(_on_input_delete_pressed.bind(input_info_inst))
	return input_info_inst
