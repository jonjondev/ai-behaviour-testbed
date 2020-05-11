class_name AttackBeaconState
extends State

var target

func _init(owner).(owner):
	pass

func on_enter():
	target = owner.get_tree().get_nodes_in_group("beacon")[0]

func on_update(delta):
	owner.move_towards(target, delta)
	if owner.is_near(target):
		target.attack()

func on_exit():
	pass
