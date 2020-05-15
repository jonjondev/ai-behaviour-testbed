class_name ActionState
extends State

var current_action

func _init(owner).(owner):
	pass

func on_enter():
	pass

func on_update():
	current_action = owner.blackboard.plan.pop_front()
	if current_action and current_action.target:
		owner.blackboard.target = current_action.target
	elif current_action:
		current_action.perform()

func on_exit():
	pass
