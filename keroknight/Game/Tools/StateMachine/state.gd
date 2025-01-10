class_name State extends Node
var g = preload("res://Game/Tools/Globals.gd")

#var animation_name: String = "idle"
var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")

var parent: Character

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
	if not parent.is_on_floor():
		print("test")
		parent.velocity.y -= gravity
	return null
