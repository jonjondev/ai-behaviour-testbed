class_name Composite
extends Behaviour

var children: Array

func _init(behaviours: Array):
	children = behaviours

func default():
	for child in children:
		child.default()
	.default()
