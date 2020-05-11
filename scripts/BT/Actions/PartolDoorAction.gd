class_name PatrolDoorAction
extends Action

var door

func _init(o).(o):
	pass

func on_initialise() -> void:
	door = owner.get_tree().get_nodes_in_group("door")[0]

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	owner.move_towards(door, owner.get_delta())
	if owner.is_near(door):
		current_status = Status.SUCCESS
		return Status.SUCCESS
	else:
		return Status.RUNNING
