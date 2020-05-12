class_name Behaviour

enum Status {DEFAULT, RUNNING, SUCCESS, FAILURE}

var current_status = Status.DEFAULT

func on_initialise() -> void:
	pass

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	pass
