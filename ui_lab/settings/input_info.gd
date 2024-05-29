extends HBoxContainer

signal delete_pressed()


@onready var inputs_toggle: Control = $InputsToggle
@onready var line_edit: LineEdit = $LineEdit
@onready var delete: Button = $Delete


func _ready() -> void:
	delete.pressed.connect(func(): delete_pressed.emit())

func update(input: GameInput) -> void:
	inputs_toggle.update(input.inputs)
	line_edit.text = input.description


func get_input() -> GameInput:
	var input = GameInput.new()
	input.inputs = inputs_toggle.get_input()
	input.description = line_edit.text
	return input
