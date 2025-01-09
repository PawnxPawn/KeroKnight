extends State

func enter() -> void:
	super()

func process_input(_event: InputEvent) -> State:
	if Input.get_axis("Forward","Back") || Input.get_axis("Right", "Left"):
		parent.state_machine.change_state()
	return null
