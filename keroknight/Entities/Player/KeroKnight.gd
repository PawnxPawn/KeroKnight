extends Character

@export var move_cool_down_timer:Timer

#Global State Variables
var can_move:bool = true

func _ready() -> void:
	super()
	move_cool_down_timer.timeout.connect(handle_move_cool_down_timer)

func handle_move_cool_down_timer() -> void:
	can_move = true

func _physics_process(delta: float) -> void:
	super(delta)
	move_and_slide()
