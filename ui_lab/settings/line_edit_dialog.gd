extends ConfirmationDialog

@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
@onready var label: Label = $VBoxContainer/Label


func _ready() -> void:
	confirmed.connect(_on_confirmed)
	canceled.connect(_on_canceled)
	
	_on_canceled()


func _on_confirmed() -> void:
	pass


func _on_canceled() -> void:
	pass
