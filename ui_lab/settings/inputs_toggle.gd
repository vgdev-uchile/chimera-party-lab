extends Control


@onready var left: Button = $Left
@onready var right: Button = $Right
@onready var up: Button = $Up
@onready var down: Button = $Down
@onready var a: Button = $A
@onready var b: Button = $B


func update(input) -> void:
	left.button_pressed = input & 1 << 0
	right.button_pressed = input & 1 << 1
	up.button_pressed = input & 1 << 2
	down.button_pressed = input & 1 << 3
	a.button_pressed = input & 1 << 4
	b.button_pressed = input & 1 << 5


func get_input() -> int:
	var input = 0
	input += 1 << 0 if left.button_pressed else 0
	input += 1 << 1 if right.button_pressed else 0
	input += 1 << 2 if up.button_pressed else 0
	input += 1 << 3 if down.button_pressed else 0
	input += 1 << 4 if a.button_pressed else 0
	input += 1 << 5 if b.button_pressed else 0
	return input
