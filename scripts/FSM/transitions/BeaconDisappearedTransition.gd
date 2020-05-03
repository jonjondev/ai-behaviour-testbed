class_name BeaconDisappearedTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return not agent_body.current_state.target.visible

func on_transition():
	pass
