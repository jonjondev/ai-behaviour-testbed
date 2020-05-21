class_name HTNRunnner

var owner
var sensor = HTNSensor
var planner = HTNPlanner.new()

var current_plan = []
var current_task = null

func _init(o):
	owner = o
	sensor = sensor.new(o)

func tick():
	if current_task:
		if current_task.operate(owner):
			current_task = current_plan.pop_front()
	elif current_plan.empty():
		var working_worldstate = sensor.generate_current_state()
		var current_plan = planner.generate_plan(working_worldstate)
		current_task = current_plan.pop_front()
