class_name PatrolSafeState
extends State

var target

func on_enter():
	transitions = [NavigatedToSafeTransition.new(), BeaconAppearedTransition.new()]
	target = agent_body.get_tree().get_nodes_in_group("safe")[0]

func on_update(delta):
	agent_body.agent_movement.move_towards(agent_body, target, delta)

func on_exit():
	pass
