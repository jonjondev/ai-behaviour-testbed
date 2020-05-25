extends Control

var agent
var behaviours

func _ready():
	agent = $"../Agent"
	behaviours = {
		"Select a Behaviour": null,
		"Finite State Machine": FiniteStateMachine.new(agent),
		"Hierarchical Finite State Machine": HierarchicalStateMachine.new(agent),
		"Behaviour Tree": ComplexBehaviourTree.new(agent),
		"Goal Oriented Action Planning": GoapStateMachine.new(agent),
		"Hierarchical Task Network": HTNRunnner.new(agent),
	}
	$OptionButton.connect("item_selected", self, "on_behaviour_selected")
	$Button.connect("pressed", self, "on_world_reset")
	for key in behaviours.keys():
		$OptionButton.add_item(key)

func on_behaviour_selected(behaviour_idx: int):
	agent.set_behaviour(behaviours.values()[behaviour_idx])

func on_world_reset():
	$"../Gun".visible = true
	$"../Sword".visible = true
	$"../Enemy".attack()
