class_name Primitive
extends Behaviour

var owner

func _init(o):
	owner = o

func on_initialise() -> void:
	pass

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	pass
