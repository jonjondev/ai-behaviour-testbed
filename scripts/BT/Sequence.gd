class_name Sequence
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	var return_status = Status.SUCCESS
	for child in children:
		if return_status != Status.SUCCESS:
			child.on_terminate(Status.FAILURE)
		else:
			var status = child.tick()
			if status != Status.SUCCESS:
				return_status = status
	return return_status
