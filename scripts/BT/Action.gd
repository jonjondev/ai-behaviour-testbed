class_name Action
extends Primitive

var current_status

func _init(o).(o):
	pass

func on_initialise() -> void:
	pass

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	current_status = status
