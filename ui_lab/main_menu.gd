extends Control

@onready var start_game: Button = %StartGame
@onready var quit: Button = %Quit


func _ready() -> void:
	start_game.pressed.connect(_on_start_game_pressed)
	quit.pressed.connect(func (): get_tree().quit())
	start_game.grab_focus()


func _on_start_game_pressed():
	for test_player in Game.test_players:
		var player_data = Statics.PlayerData.new()
		player_data.name = test_player.name
		player_data.input = test_player.input
		player_data.primary_color = test_player.color
		Game.players.append(player_data)
	Game.load_game("res://ui_lab/game_info.tscn")
