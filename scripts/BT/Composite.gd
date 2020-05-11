class_name Composite
extends Behaviour

var children: Array

func _init(behaviours: Array):
	children = behaviours

func on_initialise() -> void:
	for child in children:
		child.on_initialise()

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	for child in children:
		child.on_terminate(status)
