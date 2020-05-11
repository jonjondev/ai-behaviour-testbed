class_name ShowAlertedAction
extends Action

var start_time

func _init(o).(o):
	pass

func on_initialise() -> void:
	pass

func update() -> int:
	if owner.blackboard.get("is_alert"):
		return Status.SUCCESS
	elif not start_time:
		start_time = OS.get_ticks_msec()
		owner.show_alerted(true)
	
	if (OS.get_ticks_msec() - start_time) < 250:
		return Status.RUNNING
	else:
		owner.show_alerted(false)
		owner.blackboard["is_alert"] = true
		start_time = null
		return Status.SUCCESS

func on_terminate(status) -> void:
	pass
