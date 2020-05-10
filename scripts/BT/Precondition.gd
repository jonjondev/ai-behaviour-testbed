class_name Precondition
extends Decorator

func _init(o, child).(o, child):
	pass

func on_initialise() -> void:
	.on_initialise()

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	pass
