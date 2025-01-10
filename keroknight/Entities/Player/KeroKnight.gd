extends Character

@export var camera_controller:Node3D
@export var move_cool_down_timer:Timer
@export var camera_lerp_speed:float = 0.15

#Global State Variables
var can_move:bool = true

func _ready() -> void:
	super()
	move_cool_down_timer.timeout.connect(handle_move_cool_down_timer)


func _physics_process(delta: float) -> void:
	super(delta)
	move_and_slide()
	update_camera()

#Allow movement on timeout
func handle_move_cool_down_timer() -> void:
	can_move = true

func update_camera() -> void:
	camera_controller.position = lerp(camera_controller.position ,Vector3(position.x, camera_controller.position.y, position.z), camera_lerp_speed)
