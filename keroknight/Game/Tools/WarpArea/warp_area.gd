extends Area3D

@export var warp_position:Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_handle_position_reset)

func _handle_position_reset(area:Area3D) -> void:
	area.get_parent().global_position = warp_position
