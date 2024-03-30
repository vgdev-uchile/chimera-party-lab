extends Control


var game_input_scene = preload("res://ui_lab/game_input.tscn")

@onready var image: TextureRect = %Image
@onready var title: Label = %Title
@onready var description: RichTextLabel = %Description
@onready var inputs_container: GridContainer = %InputsContainer


func _ready() -> void:
	var info = Game.test_game_info
	if not info:
		Debug.log("No test_game_info info on Game autoload")
		return
	image.texture = info.image
	title.text = info.name
	description.text = info.description
	for game_input in info.inputs:
		var game_input_inst = game_input_scene.instantiate()
		inputs_container.add_child(game_input_inst)
		game_input_inst.setup(game_input)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if not Game.test_game_path:
			Debug.log("No test_game_path set on Game")
		Game.load_game(Game.test_game_path)
