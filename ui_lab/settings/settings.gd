extends Control

@onready var back: Button = %Back

@onready var game_info: Control = $GameInfo

@onready var game_title_button: Button = $GameTitleButton
@onready var description_button: Button = $DescriptionButton
@onready var image_button: Button = $ImageButton
@onready var inputs_button: Button = $InputsButton
@onready var author_button: Button = $AuthorButton
@onready var credits_button: Button = $CreditsButton


@onready var game_title_dialog: ConfirmationDialog = $GameTitleDialog
@onready var description_dialog: ConfirmationDialog = $DescriptionDialog
@onready var image_dialog: FileDialog = $ImageDialog
@onready var inputs_dialog: ConfirmationDialog = $InputsDialog
@onready var author_dialog: ConfirmationDialog = $AuthorDialog
@onready var credits_dialog: ConfirmationDialog = $CreditsDialog


func _ready() -> void:
	hide()
	
	back.pressed.connect(func(): hide())
	
	game_title_button.pressed.connect(func(): game_title_dialog.show())
	game_title_dialog.confirmed.connect(func(): game_info.update_info())
	
	description_button.pressed.connect(func(): description_dialog.show())
	description_dialog.confirmed.connect(func(): game_info.update_info())
	
	image_button.pressed.connect(func(): image_dialog.show())
	image_dialog.file_selected.connect(func(path): game_info.update_info())
	
	inputs_button.pressed.connect(func(): inputs_dialog.show())
	inputs_dialog.confirmed.connect(func(): game_info.update_info())
	
	author_button.pressed.connect(func(): author_dialog.show())
	author_dialog.confirmed.connect(func(): game_info.update_info())
	
	credits_button.pressed.connect(func(): credits_dialog.show())
	credits_dialog.confirmed.connect(func(): game_info.update_info())
	
	remove_child(credits_button)
	
	
	var credits_button_control = Control.new()
	game_info.credits_window.add_child(credits_button_control)

	credits_button_control.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
	credits_button_control.add_child(credits_button)
	credits_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)

