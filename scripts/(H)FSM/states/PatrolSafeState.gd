class_name PatrolSafeState
extends State

var target

func _init(owner).(owner):
	pass

func on_enter():
	target = owner.get_tree().get_nodes_in_group("safe")[0]

func on_update():
	owner.navigation.target = target

func on_exit():
	owner.navigation.target = null
