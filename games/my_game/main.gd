extends Node2D

@export var player_scene: PackedScene
const SCORE = preload("res://games/my_game/ui/score.tscn")
@onready var players: Node2D = $Players
@onready var spawns: Node2D = $Spawns
@onready var score_timer: Timer = $ScoreTimer
@onready var game_timer: Timer = $GameTimer
@onready var score_container: GridContainer = %ScoreContainer


func _ready() -> void:
	if not player_scene:
		Debug.log("No player scene selected")
		return
	for i in Game.players.size():
		var player_data = Game.players[i]
		var player_inst = player_scene.instantiate()
		player_inst.global_position = spawns.get_child(i).global_position
		players.add_child(player_inst)
		player_inst.setup(player_data)
		
		var score = SCORE.instantiate()
		score.setup(player_data)
		score_container.add_child(score)
	
	score_timer.timeout.connect(_on_score_timeout)
	game_timer.timeout.connect(func(): Game.end_game())



func _on_score_timeout() -> void:
	for player_data in Game.players:
		player_data.local_score += 10
