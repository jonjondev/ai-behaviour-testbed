class_name ShowAlertedAction
extends Action

var start_time

func _init(o).(o):
	pass

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	
	if not start_time:
		start_time = OS.get_ticks_msec()
		owner.show_alerted(true)
	
	if (OS.get_ticks_msec() - start_time) >= 250:
		owner.show_alerted(false)
		start_time = null
		return Status.SUCCESS
	return Status.RUNNING
