class_name AnimateAction
extends Action

var animation_name
var start_time

func _init(o, animation).(o):
	animation_name = animation

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	
	if not start_time:
		start_time = OS.get_ticks_msec()
		owner.start_anim(animation_name)
	
	if (OS.get_ticks_msec() - start_time) >= 250:
		owner.stop_anim(animation_name)
		start_time = null
		return Status.SUCCESS
	return Status.RUNNING
