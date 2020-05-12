class_name Decorator
extends Behaviour

var child: Behaviour

func _init(behaviour: Behaviour):
	child = behaviour

func on_initialise() -> void:
	child.on_initialise()

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	child.on_terminate(status)
