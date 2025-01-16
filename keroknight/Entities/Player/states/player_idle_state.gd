extends State

func enter() -> void:
	animation_name = g.ANIM_IDLE
	parent.velocity = Vector3.ZERO
	super()

func process_input(_event: InputEvent) -> void:
	if (Input.get_axis(g.INPUT_FORWARD,g.INPUT_BACKWARD) or Input.get_axis(g.INPUT_LEFT, g.INPUT_RIGHT)):
		state_return(g.STATE_MOVE)

func process_physics(delta:float) -> void:
	if not parent.is_on_floor():
		parent.velocity.y -= gravity
