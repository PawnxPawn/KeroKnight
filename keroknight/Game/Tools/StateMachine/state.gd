class_name State extends Node
var g = preload("res://Game/Tools/Globals.gd")

var animation_name: String = "idle"
var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")

var parent: Character

func enter() -> void:
	#parent.sprite.animation = animation_name
	#parent.sprite.play()
	pass

func exit() -> void:
	pass

## Call in _unhandled_input(event: InputEvent) of parent
func process_input(_event: InputEvent) -> State:
	return null

## Call in _process of parent
func process_frame(_delta: float) -> State:
	return null

## Call in _
func process_physics(_delta: float) -> State:
	#This does not need to be called here. But it's currently being used in all my states
	if not parent.is_on_floor():
		parent.velocity.y -= gravity
	return null
