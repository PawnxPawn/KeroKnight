extends State

@export var move_speed:float = 2.0
@export var move_lerp_speed:float = 0.5

var direction:Vector3 = Vector3.ZERO

func enter() -> void:
	animation_name = g.ANIM_MOVE

func process_input(_event: InputEvent) -> void:
	direction.z = Input.get_axis(g.INPUT_FORWARD, g.INPUT_BACKWARD)
	direction.x = Input.get_axis(g.INPUT_LEFT,g.INPUT_RIGHT)
	if direction and not direction.y:
		direction.y = 5.0
	else:
		direction.y = 0

func process_physics(delta:float) -> void:
	grid_movement()
	if not parent.is_on_floor():
		parent.velocity.y -= gravity

#Moves player in a snappy way with grid like movement.
func grid_movement() -> void:
	if direction and not (direction.x and direction.z) and parent.can_move and parent.is_on_floor():
		find_rotation()
		parent.anim_player_node.play(animation_name)
		var tween = create_tween()
		tween.tween_property(parent, "global_position", parent.forward_ray_cast.global_position,1.0/3).set_trans(Tween.TRANS_SINE)
		parent.can_move = false

func find_rotation() -> void:
	if direction.z < 0:
		parent.rotation_degrees.y = 0
	if direction.z > 0:
		parent.rotation_degrees.y = 180
	if direction.x < 0:
		parent.rotation_degrees.y = 90
	if direction.x > 0:
		parent.rotation_degrees.y = 270
