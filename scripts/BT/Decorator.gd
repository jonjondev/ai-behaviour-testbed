class_name Decorator
extends Behaviour

var owner
var child: Behaviour

func _init(o, behaviour: Behaviour):
	owner = o
	child = behaviour

func on_initialise() -> void:
	child.on_initialise()

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	child.on_terminate(status)
