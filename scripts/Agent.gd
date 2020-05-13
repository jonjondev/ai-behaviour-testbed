extends KinematicBody

export (GDScript) var behaviour_algorithm

var navigation = NavigationManager.new(self)
var animation = AnimationManager.new(self)
var blackboard = {}

func _ready():
	behaviour_algorithm = behaviour_algorithm.new(self)
	if behaviour_algorithm.has_method("on_enter"):
		behaviour_algorithm.on_enter()

func _physics_process(delta):
	if behaviour_algorithm.has_method("on_update"):
		behaviour_algorithm.on_update(delta)
	elif behaviour_algorithm.has_method("tick"):
		behaviour_algorithm.tick()
	navigation.process()


func is_near(target):
	return target and translation.distance_to(target.translation) < 0.2
