extends Spatial

func _ready():
	var _error = $Timer.connect("timeout", self, "toggle_signal")

func toggle_signal():
	visible = !visible
