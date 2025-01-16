class_name Character extends CharacterBody3D

var g = preload("res://Game/Tools/Globals.gd")

@onready var state_machine:StateMachine = $StateMachine

@export_category("Required")
@export var anim_player_node:AnimationPlayer 
@export var collision_node:CollisionShape3D

@export_category("Movement")
@export var move_speed:float = 5.0


func _unhandled_input(event: InputEvent) -> void:
	state_machine.get_current_state.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.get_current_state.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.get_current_state.process_frame(delta)
