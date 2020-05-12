class_name RepeatFilter
extends Decorator

var repeat_value
var repeated = 0

func _init(value: int, behaviour: Behaviour).(behaviour):
	repeat_value = value
	.on_initialise()

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	var status = child.tick()
	if status == Status.SUCCESS:
		repeated += 1
		default()
	elif status == Status.FAILURE:
		return Status.FAILURE
	else:
		return status
	
	if repeated >= repeat_value:
		repeated = 0
		return Status.SUCCESS
	else:
		return Status.RUNNING
