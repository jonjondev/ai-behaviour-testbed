class_name AgentMovement

var move_speed: float = 2
var gravity: Vector3 = Vector3(0, -10, 0)
var velocity: Vector3 = Vector3.ZERO

func move_towards(body, target, delta):
	var move = Vector3.ZERO
	if target and body.translation.distance_to(target.translation) > 0.1:
		move = (target.translation - body.translation).normalized() * move_speed
		move.y = 0
	
	velocity = body.move_and_slide(move + (velocity + gravity * delta))
	velocity = Vector3(0, velocity.y, 0)

func is_near_target(body, target):
	return target and body.translation.distance_to(target.translation) < 0.2
