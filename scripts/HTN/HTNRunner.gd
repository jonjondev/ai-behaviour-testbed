class_name HTNRunnner

var owner
var sensor = HTNSensor
var planner = HTNPlanner.new()

var current_plan = []
var current_task = null

var expected_worldstate

func _init(o):
	owner = o
	sensor = sensor.new(o)
	expected_worldstate = sensor.generate_current_state()

func tick():
	var real_worldstate = sensor.generate_current_state()
	if expected_worldstate.hash() != real_worldstate.hash():
		replan(real_worldstate)
	if current_task:
		if current_task.operate(owner):
			expected_worldstate = planner.apply_effects(expected_worldstate, current_task.effects)
			current_task = current_plan.pop_front()
	elif current_plan.empty():
		replan(real_worldstate)

func replan(worldstate):
	current_plan = planner.generate_plan(worldstate)
	current_task = current_plan.pop_front()
	expected_worldstate = worldstate
