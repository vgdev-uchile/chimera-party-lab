extends Node2D

@export var player_scene: PackedScene

@onready var players: Node2D = $Players
@onready var spawns: Node2D = $Spawns
@onready var score_timer: Timer = $ScoreTimer
@onready var game_timer: Timer = $GameTimer
@onready var score_container: VBoxContainer = %ScoreContainer


func _ready() -> void:
	if not player_scene:
		Debug.log("No player scene selected")
		return
	for i in Game.players.size():
		var player_data = Game.players[i]
		var player_inst = player_scene.instantiate() as Chimerin
		player_inst.global_position = spawns.get_child(i).global_position
		players.add_child(player_inst)
		player_inst.setup(player_data)
		
		var hbox = HBoxContainer.new()
		var color_rect = ColorRect.new()
		color_rect.custom_minimum_size = Vector2.ONE * 100
		color_rect.color = player_data.primary_color
		hbox.add_child(color_rect)
		var label = Label.new()
		hbox.add_child(label)
		label.text = str(player_data.local_score)
		score_container.add_child(hbox)
	
	score_timer.timeout.connect(_on_score_timeout)
	game_timer.timeout.connect(func(): Game.end_game())


func _process(delta: float) -> void:
	for i in Game.players.size():
		var player_data = Game.players[i]
		var label = score_container.get_child(i).get_child(1) as Label
		label.text = str(player_data.local_score)


func _on_score_timeout() -> void:
	for player_data in Game.players:
		player_data.local_score += 100
