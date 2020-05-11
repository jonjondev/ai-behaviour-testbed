class_name Behaviour

enum Status {SUCCESS, RUNNING, FAILURE, COMPLETED, SUSPENDED}

func on_initialise() -> void:
	pass

func update() -> int:
	return Status.FAILURE

func on_terminate(status) -> void:
	pass
