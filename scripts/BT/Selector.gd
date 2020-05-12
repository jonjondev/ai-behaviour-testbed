class_name Selector
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	for child in children:
		var status = child.tick()
		if status != Status.FAILURE:
			if status == Status.SUCCESS:
				default()
			return status
	return Status.FAILURE
