class_name Parallel
extends Composite

func _init(behaviours: Array).(behaviours):
	pass

func update() -> int:
	var success_count = 0
	var failure_count = 0
	
	for child in children:
		var state = child.update()
		match(state):
			Status.SUCCESS:
				success_count += 1
			Status.FAILURE:
				failure_count += 1
		
		if success_count >= children.size():
			return Status.SUCCESS
		elif failure_count > 0:
			return Status.FAILURE
	return Status.RUNNING

func on_terminate(status) -> void:
	pass