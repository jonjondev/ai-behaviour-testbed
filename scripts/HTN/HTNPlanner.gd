class_name HTNPlanner

var root_task = BeGuardTask

func _init():
	root_task = root_task.new()

func generate_plan(working_worldstate) -> Array:
	return [NavigateToEnemyTask.new()]
	var final_plan = []
	var tasks_to_process = []
	tasks_to_process.push_back(root_task)
	while not tasks_to_process.empty():
		var current_task = tasks_to_process.pop_front()
		if current_task is CompoundTask:
			var satisfied_method = current_task.find_satisfied_method(working_worldstate)
			if satisfied_method:
				record_decomposition_of_task()
				tasks_to_process.push_front(satisfied_method)
			else:
				restore_to_last_decomposed_task()
		else:
			if current_task.precondition_valid(working_worldstate):
				apply_effects(working_worldstate, current_task.effects)
				final_plan.push_back(current_task)
			else:
				restore_to_last_decomposed_task()
	return final_plan

func apply_effects(working_worldstate, worldstate_changes):
	pass

func record_decomposition_of_task():
	pass

func restore_to_last_decomposed_task():
	pass
