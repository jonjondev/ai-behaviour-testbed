class_name NavigationManager

var agent
var move_speed: float = 2
var velocity: Vector3 = Vector3.ZERO
var gravity: Vector3 = Vector3(0, -10, 0)

var driver
var target

func _init(owner):
	agent = owner

func process():
	var move = Vector3.ZERO
	if target and agent.translation.distance_to(target.translation) > 0.1:
		move = (target.translation - agent.translation).normalized() * move_speed
		move.y = 0
	velocity = agent.move_and_slide(move + (velocity + gravity * agent.get_physics_process_delta_time()))
	velocity = Vector3(0, velocity.y, 0)

func set_target(d, t):
	if not driver or driver == d:
		driver = d
		target = t

func unset_target(d):
	if driver == d:
		target = null
		driver = null
