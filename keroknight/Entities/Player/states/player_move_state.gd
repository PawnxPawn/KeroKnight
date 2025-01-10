extends State

@export var move_speed:float = 2.0
@export var jump_velocity:float = 4.5
@export var move_lerp_speed:float = 0.3

var direction:Vector3 = Vector3.ZERO
var can_move:bool = true

func process_input(_event: InputEvent) -> State:
	direction.z = Input.get_axis(g.INPUT_FORWARD, g.INPUT_BACKWARD)
	direction.x = Input.get_axis(g.INPUT_LEFT,g.INPUT_RIGHT)
	grid_movement()
	return null

#Moves player in a snappy way with grid like movement.
func grid_movement() -> void:
	if direction and not (direction.x and direction.z) and can_move and parent.is_on_floor():
		parent.velocity.y += jump_velocity * gravity
		var new_position = parent.global_position + (direction * move_speed)
		parent.global_position = lerp(parent.global_position, new_position, move_lerp_speed)      
		parent.can_move = false
		parent.move_cool_down_timer.start()
		parent.state_machine.change_state(g.STATE_IDLE)
