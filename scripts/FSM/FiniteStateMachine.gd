extends KinematicBody

var agent_movement = AgentMovement.new()
var current_state: State = PatrolDoorState.new()

func _ready():
	current_state.agent_body = self
	current_state.on_enter()

func _physics_process(delta):
	for transition in current_state.transitions:
		transition.agent_body = self
		if transition.is_valid():
			current_state.on_exit()
			transition.agent_body = self
			transition.on_transition()
			current_state = transition.next_state
			current_state.agent_body = self
			current_state.on_enter()
			break
	current_state.on_update(delta)
