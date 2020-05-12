class_name Sequence
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	for child in children:
		var state = child.tick()
		if state != Status.SUCCESS:
			return state
	default()
	return Status.SUCCESS
