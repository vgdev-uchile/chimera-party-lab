extends Control

@onready var back: Button = %Back

@onready var game_info: Control = $GameInfo

@onready var game_title_button: Button = $GameTitleButton
@onready var description_button: Button = $DescriptionButton
@onready var image_button: Button = $ImageButton
@onready var inputs_button: Button = $InputsButton
@onready var players_button: Button = $PlayersButton


@onready var game_title_dialog: ConfirmationDialog = $GameTitleDialog
@onready var description_dialog: ConfirmationDialog = $DescriptionDialog

func _ready() -> void:
	back.pressed.connect(func(): get_tree().change_scene_to_file("res://ui_lab/main_menu.tscn"))
	back.grab_focus()
	
	game_title_button.pressed.connect(func(): game_title_dialog.show())
	
	description_button.pressed.connect(func(): description_dialog.show())
	description_dialog.confirmed.connect(func(): _update_info())


func _update_info() -> void:
	game_info._ready()


