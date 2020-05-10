extends KinematicBody

export (GDScript) var behaviour_algorithm

var move_speed: float = 2
var gravity: Vector3 = Vector3(0, -10, 0)
var velocity: Vector3 = Vector3.ZERO

var blackboard = {}

func _ready():
	behaviour_algorithm = behaviour_algorithm.new(self)
	if behaviour_algorithm.has_method("on_enter"):
		behaviour_algorithm.on_enter()

func _physics_process(delta):
	if behaviour_algorithm.has_method("on_update"):
		behaviour_algorithm.on_update(delta)
	elif behaviour_algorithm.has_method("tick"):
		behaviour_algorithm.tick()

func move_towards(target, delta):
	var move = Vector3.ZERO
	if target and translation.distance_to(target.translation) > 0.1:
		move = (target.translation - translation).normalized() * move_speed
		move.y = 0
	velocity = move_and_slide(move + (velocity + gravity * delta))
	velocity = Vector3(0, velocity.y, 0)

func is_near(target):
	return target and translation.distance_to(target.translation) < 0.2

func get_delta() -> float:
	return get_physics_process_delta_time()
