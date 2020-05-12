class_name RepeatFilter
extends Decorator

var current_status
var repeat_value
var repeated = 0

func _init(value: int, behaviour: Behaviour).(behaviour):
	repeat_value = value

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	
	var status = child.update()
	if status == Status.SUCCESS:
		repeated += 1
		child.on_terminate(Status.COMPLETED)
	elif status == Status.FAILURE:
		return Status.FAILURE
	else:
		return status
	
	if repeated >= repeat_value:
		current_status = Status.SUCCESS
		return Status.SUCCESS
	else:
		return Status.RUNNING

func on_terminate(status) -> void:
	repeated = 0
	current_status = status
	.on_terminate(status)
