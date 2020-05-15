class_name PlanningState
extends State

func _init(owner).(owner):
	pass

func on_enter():
	owner.blackboard.plan = [AttackBeaconGoapAction.new(owner)]

func on_update():
	pass

func on_exit():
	pass
