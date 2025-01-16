extends AnimatableBody3D
const g := preload("res://Game/Tools/Globals.gd")

@export var move_speed:float
@export var jump_velocity:float
@export var set_direction:g.Direction

var warp_location = Vector3.ZERO
var can_warp:bool = false
var move_direction:Vector3 = Vector3.ZERO

func _physics_process(delta: float) -> void:
	var rate = move_speed * delta
	warp()
	if not can_warp:
		move_platform(rate)
	else:
		can_warp = false

func warp() -> void:
	if can_warp:
		global_position = warp_location
		

func move_platform(rate) -> void:
	if set_direction == g.Direction.LEFT:
		global_position.x -= rate * set_direction
	if set_direction == g.Direction.RIGHT:
		global_position.x += rate * set_direction
	
