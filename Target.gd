extends Spatial

func _ready():
	$Area.connect("body_entered", self, "target_reached")

func target_reached(body):
	body.target = null
