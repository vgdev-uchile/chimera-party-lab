extends Node

var players_components: Array[PlayerComponent] = [null, null, null, null, null, null, null, null]

# Array[Array[InteractableComponent3D]
var players_interactable_lists_3d: Array[Array] = [[], [], [], [], [], [], [], []]

var interaction_action: String = "action_a_%d"

# Private

# Called when the node enters the scene tree for the first time
func _ready():
	pass # Replace with function body.

# Called on an input event trigger
func _input(event: InputEvent):
	for player_input in range(players_interactable_lists_3d.size()):
		if not event.is_action_pressed(interaction_action % player_input):
			continue
		
		var player_component = players_components[player_input]
		
		if player_component == null:
			continue
			
		var interactable_list = players_interactable_lists_3d[player_input]
		
		if not interactable_list.is_empty():
			interactable_list.back().interact(player_component)

# Public

# Sets the interaction action
func set_interaction_action(action: String) -> void:
	interaction_action = action + "_%d"

# Adds an interactable component 3D to the list
func add_interactable_component_3d(interactable: InteractableComponent3D, player_component: PlayerComponent) -> void:
	var player_input = player_component.data.input
	
	if players_components[player_input] == null:
		players_components[player_input] = player_component
	
	var interactable_list = players_interactable_lists_3d[player_input]
	
	if not interactable_list.is_empty():
		interactable_list.back().hide_input(player_input)
	
	if not interactable in interactable_list:
		interactable_list.push_back(interactable)
	
	interactable.show_input(player_input)

# Removes an interactable component 3D from the list
func remove_interactable_component_3d(interactable: InteractableComponent3D, player_component: PlayerComponent) -> void:
	var player_input = player_component.data.input
	var interactable_list = players_interactable_lists_3d[player_input]
	
	interactable.hide_input(player_input)
	
	if interactable in interactable_list:
		interactable_list.erase(interactable)
		
	if not interactable_list.is_empty():
		interactable_list.back().show_input(player_input)



