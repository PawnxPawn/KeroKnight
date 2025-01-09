class_name Character
extends CharacterBody3D

@onready var state_machine:StateMachine = $StateMachine

@export var move_speed:float = 5.0
@export var jump_velocity = 5.0

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.get_current_state.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.get_current_state.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.get_current_state.process_frame(delta)
