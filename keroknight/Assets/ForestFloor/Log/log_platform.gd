extends AnimatableBody3D
const g := preload("res://Game/Tools/Globals.gd")

@export var move_speed:float
@export var set_direction:g.Direction

var move_direction:Vector3 = Vector3.ZERO

func _ready() -> void:
	if set_direction == g.Direction.LEFT:
		move_direction = Vector3.LEFT
	elif set_direction == g.Direction.RIGHT:
		move_direction = Vector3.RIGHT

func _physics_process(delta: float) -> void:
	var rate = move_speed * delta
	move_platform(rate)

func move_platform(rate) -> void:
	global_position.x += rate
