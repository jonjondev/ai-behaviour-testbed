extends Spatial

func _ready():
	var _error = $Timer.connect("timeout", self, "toggle_signal")

func toggle_signal():
	$Timer.stop()
	visible = true

func attack():
	visible = false
	$Timer.start()
