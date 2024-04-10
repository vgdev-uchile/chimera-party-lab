class_name PlayerComponent
extends Node
## Base class for a player.
##
## Allows to setup player input with a [PlayerData].[br]
## You must override [method update_color] to set your change color logic.

signal data_updated

## Player data.
var data: PlayerData:
	set(value):
		data = value
		move_left = "move_left_%d" % data.input
		move_right = "move_right_%d" % data.input
		move_up = "move_up_%d" % data.input
		move_down = "move_down_%d" % data.input
		action_a = "action_a_%d" % data.input
		action_b = "action_b_%d" % data.input

## Move left action name.
var move_left: StringName = "move_left"
## Move right action name.
var move_right: StringName = "move_right"
## Move up action name.
var move_up: StringName = "move_up"
## Move down action name.
var move_down: StringName = "move_down"
## Action A action name.
var action_a: StringName  = "action_a"
## Action B action name.
var action_b: StringName  = "action_b"

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data:
		data_updated.emit()

## Setup player data.[br]
## Must be called before instancing the player.
func setup(player_data: PlayerData) -> void:
	data = player_data
	data_updated.emit()
