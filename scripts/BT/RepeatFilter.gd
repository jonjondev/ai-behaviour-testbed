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
	while true:
		var status = child.tick()
		match(status):
			Status.RUNNING:
				break
			Status.FAILURE:
				return Status.FAILURE
			Status.SUCCESS:
				repeated += 1
				default()
		if repeated >= repeat_value:
			repeated = 0
			return Status.SUCCESS
	return Status.RUNNING
