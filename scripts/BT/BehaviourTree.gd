class_name BehaviourTree
extends Primitive

var root

func _init(o).(o):
	pass

func update() -> int:
	var status = root.tick()
	if status == Status.SUCCESS:
		default()
	return status

func default():
	root.default()
	.default()
