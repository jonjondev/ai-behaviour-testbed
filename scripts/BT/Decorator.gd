class_name Decorator
extends Behaviour

var child: Behaviour

func _init(behaviour: Behaviour):
	child = behaviour

func default():
	child.default()
	.default()
