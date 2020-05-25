extends KinematicBody

export (GDScript) var behaviour_algorithm

var navigation = NavigationManager.new(self)
var animation = AnimationManager.new(self)
var blackboard = {}

func _ready():
	var _err = $AITime.connect("timeout", self , "ai_process")
	if behaviour_algorithm:
		behaviour_algorithm = behaviour_algorithm.new(self)

func _physics_process(_delta):
	navigation.process()
	ai_initialise()

func set_behaviour(behaviour):
	behaviour_algorithm = behaviour
	ai_initialise()

func ai_initialise():
	if behaviour_algorithm and behaviour_algorithm.has_method("on_enter"):
		behaviour_algorithm.on_enter()

func ai_process():
	if behaviour_algorithm:
		if behaviour_algorithm.has_method("on_update"):
			behaviour_algorithm.on_update()
		elif behaviour_algorithm.has_method("tick"):
			behaviour_algorithm.tick()

func is_near(target):
	return target and distance_to(target) < 0.2

func distance_to(target):
	return translation.distance_to(target.translation)
