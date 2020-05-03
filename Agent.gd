extends KinematicBody

var move_speed: float = 2
var gravity: Vector3 = Vector3(0, -10, 0)
var velocity: Vector3 = Vector3.ZERO

var target = Vector3.ZERO

func _ready():
	var targets = get_tree().get_nodes_in_group("target")
	if targets.size() == 1:
		target = targets[0].translation

func _physics_process(delta):
	if target and translation.distance_to(target) > 0.1:
		var move = (target - translation).normalized() * move_speed
		move.y = 0
		move_and_slide(move)
	
	velocity += gravity * delta 
	velocity = move_and_slide(velocity)
