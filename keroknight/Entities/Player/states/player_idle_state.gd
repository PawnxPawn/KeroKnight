extends State

func process_input(_event: InputEvent) -> State:
	if (Input.get_axis(g.INPUT_FORWARD,g.INPUT_BACKWARD) or Input.get_axis(g.INPUT_LEFT, g.INPUT_RIGHT)) and parent.can_move and parent.is_on_floor():
		parent.state_machine.change_state(g.STATE_MOVE)
	return null
