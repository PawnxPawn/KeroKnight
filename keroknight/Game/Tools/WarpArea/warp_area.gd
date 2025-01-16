extends Area3D

@export var warp_position:Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_handle_position_reset)
	warp_position = Vector3(warp_position.x, global_position.y, warp_position.z)
	

func _handle_position_reset(body:Node3D) -> void:
	body.warp_location = warp_position
	body.can_warp = true
