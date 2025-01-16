class_name State extends Node
var g = preload("res://Game/Tools/Globals.gd")

var animation_name: String = g.ANIM_IDLE
var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")

var parent: Character

func enter() -> void:
	parent.anim_player_node.play(animation_name)
	pass

func exit() -> void:
	pass

## Call in _unhandled_input(event: InputEvent) of parent
func process_input(_event: InputEvent) -> void:
	pass

## Call in _process of parent
func process_frame(_delta: float) -> void:
	pass

## Call in _
func process_physics(_delta: float) -> void:
	pass

# Helper Functions 
func state_return(state_search:String) -> void:
	for state in parent.state_machine.get_state_list:
		if state.name == state_search:
			parent.state_machine.change_state(state)
