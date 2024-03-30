extends Control

@onready var image: TextureRect = %Image
@onready var title: Label = %Title
@onready var description: RichTextLabel = %Description


func _ready() -> void:
	var info = Game.test_game_info
	if not info:
		Debug.log("No test_game_info info on Game autoload")
		return
	image.texture = info.image
	title.text = info.name
	description.text = info.description

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if not Game.test_game_path:
			Debug.log("No test_game_path set on Game")
		Game.load_game(Game.test_game_path)
