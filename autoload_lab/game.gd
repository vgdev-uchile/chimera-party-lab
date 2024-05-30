extends Control


@export var test_players: Array[PlayerResource] = []
@export var test_game_scene: PackedScene
@export var test_game_info: GameInfo

var players: Array[PlayerData] = []

var _game_to_load: String
@onready var animation_player: AnimationPlayer = $CanvasLayer/Fade/AnimationPlayer


func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(_game_to_load)
	match status:
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			Debug.log("Invalid resource")
			animation_player.play("fade_in")
			set_process(false)
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			pass
		ResourceLoader.THREAD_LOAD_FAILED:
			Debug.log("Load failed")
			animation_player.play("fade_in")
			set_process(false)
		ResourceLoader.THREAD_LOAD_LOADED:
			var loaded_game = ResourceLoader.load_threaded_get(_game_to_load)
			get_tree().change_scene_to_packed(loaded_game)
			animation_player.play("fade_in")
			set_process(false)


func load_game(path):
	if is_processing():
		return
	if not FileAccess.file_exists(path):
		Debug.log("The path %s doesn't exists" % path)
		return
	_game_to_load = path
	animation_player.play("fade_out")
	ResourceLoader.load_threaded_request(_game_to_load)
	set_process(true)


func end_game() -> void:
	Game.players.clear()
	load_game("res://ui_lab/main_menu.tscn")
	

func get_current_game_info() -> GameInfo:
	return test_game_info


func load_current_game():
	if not test_game_scene:
		Debug.log("No test scene selected")
		return
	load_game(test_game_scene.resource_path)


func get_current_game_path() -> String:
	return "res://games/my_game"
