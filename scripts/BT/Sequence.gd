class_name Sequence
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	for child in children:
		var state = child.update()
		if not state == Status.SUCCESS:
			if state == Status.FAILURE:
				on_terminate(state)
				break
			return state
	on_terminate(Status.COMPLETED)
	return Status.SUCCESS
