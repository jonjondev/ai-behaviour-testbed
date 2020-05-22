class_name HTNSensor

enum WorldStateProperties {
	ENEMY_ALIVE,
	WEAPON_AVAILABLE,
	WEAPON_ACQUIRED,
}

enum EnemyRange {
	MELEE_RANGE,
	RANGED_RANGE,
}

var owner
var blank_state = []

func _init(o):
	owner = o
	for _i in range(WorldStateProperties.size()):
		blank_state.append(null)

func generate_current_state():
	var current_state = blank_state.duplicate()
	current_state[WorldStateProperties.ENEMY_ALIVE] = owner.get_tree().get_nodes_in_group("enemy")[0].visible
	#current_state[WorldStateProperties.ENEMY_RANGE] = EnemyRange.MELEE_RANGE if owner.distance_to(owner.get_tree().get_nodes_in_group("enemy")[0]) < 5 else EnemyRange.RANGED_RANGE
	current_state[WorldStateProperties.WEAPON_AVAILABLE] = owner.get_tree().get_nodes_in_group("weapon")[0].visible
	current_state[WorldStateProperties.WEAPON_ACQUIRED] = owner.blackboard.get("weapon") == true
	return current_state
