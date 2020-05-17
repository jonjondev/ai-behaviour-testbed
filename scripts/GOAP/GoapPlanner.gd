class_name GoapPlanner

enum StateConditions {
	BEACON_ALIVE,
	WEAPON_AVAILABLE,
	WEAPON_ACQUIRED,
}

var agent_profile
var valid_paths
var checked_actions

func generate_plan(current_state, agent):
	agent_profile = agent
	valid_paths = []
	checked_actions = []
	if not conditions_valid(current_state, agent_profile.goal_state):
		generate_valid_paths(current_state)
	var recommended_path = valid_paths if valid_paths.empty() else valid_paths.min()
	return recommended_path

func generate_valid_paths(previous_state, previous_actions = []):
	for action in agent_profile.actions:
		if checked_actions.has(action):
			continue
		elif conditions_valid(previous_state, action.preconditions):
			var new_actions = previous_actions.duplicate()
			new_actions.append(action)
			var action_state = apply_effects(previous_state, action.effects)
			checked_actions.append(action)
			if conditions_valid(action_state, agent_profile.goal_state):
				valid_paths.append(new_actions)
			else:
				generate_valid_paths(action_state, new_actions)

func conditions_valid(state, conditions):
	for condition in conditions.keys():
		if state[condition] != conditions[condition]:
			return false
	return true

func apply_effects(state, effects):
	var new_state = state.duplicate()
	for effect in effects.keys():
		new_state[effect] = effects[effect]
	return new_state
