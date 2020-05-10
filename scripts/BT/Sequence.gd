class_name Sequence
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	for child in children:
		var state = child.update()
		if not state == Status.SUCCESS:
			return state
	return Status.SUCCESS

func on_terminate(status) -> void:
	pass
