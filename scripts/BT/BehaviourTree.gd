class_name BehaviourTree
extends Primitive

var root

func _init(o).(o):
	pass

func update() -> int:
	return root.tick()
