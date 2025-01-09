class_name State extends Node

#var animation_name: String = "idle"
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Character
var state_list = parent.state_machine.state_list

func enter() -> void:
	#parent.sprite.animation = animation_name
	#parent.sprite.play()
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
