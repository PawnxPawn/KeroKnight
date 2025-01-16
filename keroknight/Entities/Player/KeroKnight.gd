extends Character

@onready var forward_ray_cast: RayCast3D = $ForwardRayCast

@export var camera_controller:Node3D
@export var camera_lerp_speed:float = 0.08

#Global State Variables
var can_move:bool = true

func _ready() -> void:
	state_machine.init(self)
	anim_player_node.animation_finished.connect(handle_animation_finished)


func _physics_process(delta: float) -> void:
	super(delta)
	move_and_slide()
	update_camera()
	

#Allow movement and move to idle
func handle_animation_finished(anim_name:String) -> void:
	if anim_name == g.ANIM_MOVE:
		can_move = true
		state_machine.get_current_state.state_return(g.ANIM_IDLE)

func update_camera() -> void:
	camera_controller.position = lerp(camera_controller.position ,Vector3(position.x, camera_controller.position.y, position.z), camera_lerp_speed)
