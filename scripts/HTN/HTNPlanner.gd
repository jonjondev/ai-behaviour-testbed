class_name HTNPlanner

var root_task = BeGuardTask.new()

var working_decomp_history
var tasks_to_process
var final_plan
var cached_method
var working_worldstate

func generate_plan(worldstate) -> Array:
	working_worldstate = worldstate
	working_decomp_history = []
	tasks_to_process = []
	final_plan = []
	cached_method = -1
	tasks_to_process.push_back(root_task)
	while not tasks_to_process.empty():
		var current_task = tasks_to_process.pop_front()
		if current_task is CompoundTask:
			var satisfied_method = current_task.find_satisfied_method(working_worldstate, cached_method)
			if satisfied_method != -1:
				record_decomposition_of_task(current_task, satisfied_method)
				for task in current_task.method_tasks[satisfied_method]:
					tasks_to_process.push_back(task)
				cached_method = -1
			else:
				restore_to_last_decomposed_task()
		else:
			if current_task.precondition_valid(working_worldstate):
				working_worldstate = apply_effects(working_worldstate, current_task.effects)
				final_plan.push_back(current_task)
			else:
				restore_to_last_decomposed_task()
	return final_plan

func apply_effects(working_worldstate, effects):
	var new_state = working_worldstate.duplicate()
	for effect in effects.keys():
		new_state[effect] = effects[effect]
	return new_state

func record_decomposition_of_task(task, method):
	working_decomp_history.push_front(
		[task, method, tasks_to_process.duplicate(), final_plan.duplicate(), working_worldstate.duplicate()])

func restore_to_last_decomposed_task():
	var previous_decomp_history = working_decomp_history.pop_front()
	cached_method = previous_decomp_history[1]
	tasks_to_process = previous_decomp_history[2]
	if previous_decomp_history[0]:
		tasks_to_process.push_front(previous_decomp_history[0])
	final_plan = previous_decomp_history[3]
	working_worldstate = previous_decomp_history[4]
