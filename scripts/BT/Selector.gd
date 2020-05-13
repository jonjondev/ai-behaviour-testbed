class_name Selector
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	var return_status = Status.FAILURE
	for child in children:
		if return_status != Status.FAILURE:
			child.on_terminate(Status.FAILURE)
		else:
			var status = child.tick()
			if status != Status.FAILURE:
				return_status = status
	return return_status
