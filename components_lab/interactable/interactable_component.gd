class_name InteractableComponent3D
extends Area3D

signal interacted(player_component: PlayerComponent)

@export var radius: float = 1.0 

@onready var collision_shape: CollisionShape3D = %CollisionShape

# Private

# Called when the node enters the scene tree for the first time
func _ready():
	var sphere_shape := SphereShape3D.new()
	sphere_shape.radius = radius
	collision_shape.shape = sphere_shape
	
	monitorable = false
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# Called when a body enters the component area
func _on_body_entered(body: Node3D):
	for child in body.get_children():
		if child is PlayerComponent: 
			InteractableManager.add_interactable_component_3d(self, child)
			break

# Called when a body exits the component area
func _on_body_exited(body: Node3D):
	for child in body.get_children():
		if child is PlayerComponent:
			InteractableManager.remove_interactable_component_3d(self, child)
			break

# Public

# Interacts with the given player
func interact(player_component: PlayerComponent):
	interacted.emit(player_component)

# Shows the given player input
func show_input(player_input: int):
	pass

# Hides the given player input
func hide_input(player_input: int):
	pass

# Disables the interactable
func disable():
	monitoring = false
