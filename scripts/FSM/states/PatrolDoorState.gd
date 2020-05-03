class_name PatrolDoorState
extends State

var target

func on_enter():
	transitions = [NavigatedToDoorTransition.new(), BeaconAppearedTransition.new()]
	target = agent_body.get_tree().get_nodes_in_group("door")[0]

func on_update(delta):
	agent_body.agent_movement.move_towards(agent_body, target, delta)

func on_exit():
	pass
