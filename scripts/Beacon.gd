extends Spatial

func _ready():
	$Timer.connect("timeout", self, "toggle_signal")

func toggle_signal():
	visible = !visible
