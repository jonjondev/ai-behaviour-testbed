class_name GeneratedPlanTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return owner.blackboard.plan and not owner.blackboard.plan.empty()

func on_transition():
	pass
