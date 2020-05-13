class_name AnimationManager

var agent
var anim_running = false
var timer 

func _init(owner):
	agent = owner

func start_anim(anim_name):
	match(anim_name):
		"alerted":
			anim_running = true
			agent.get_node("AlertedIndicator").visible = true
			agent.get_tree().create_timer(1.0).connect("timeout", self, "stop_anim")

func stop_anim():
	agent.get_node("AlertedIndicator").visible = false
	anim_running = false
