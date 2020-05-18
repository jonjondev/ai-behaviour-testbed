class_name AttackEnemyState
extends State

var target

func _init(owner).(owner):
	pass

func on_enter():
	target = owner.get_tree().get_nodes_in_group("enemy")[0]

func on_update():
	owner.navigation.target = target
	if owner.is_near(target):
		target.attack()

func on_exit():
	owner.navigation.target = null
