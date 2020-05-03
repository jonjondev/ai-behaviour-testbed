class_name NavigatedToDoorTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return agent_body.current_state.target.is_in_group("door") and agent_body.agent_movement.is_near_target(agent_body, agent_body.current_state.target)

func on_transition():
	pass