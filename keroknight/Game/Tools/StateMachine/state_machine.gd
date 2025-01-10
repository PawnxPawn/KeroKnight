class_name StateMachine
extends Node

@export var starting_state:State
@export var state_list:Array[State]

var _current_state = null
var _last_state = null
var get_last_state: State:
	get:
		return _last_state

var get_current_state: State:
	get:
		return _current_state

func init(parent:Character) -> void:
	for child in get_children():
		child.parent = parent
	change_state(starting_state.name)

func change_state(new_state_string: String) -> void:
	var new_state = find_state(new_state_string)
	if not new_state:
		push_error("Current State: %s NOT FOUND" % new_state_string)
	
	if _current_state:
		_current_state.exit()
	
	_last_state = _current_state
	
	_current_state = new_state
	_current_state.enter()

# Pass through functions for the Player
func process_physics(delta: float) -> void:
	var new_state = _current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = _current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = _current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func find_state(state_search:String) -> State:
	for state in state_list:
		if state.name == state_search:
			return state
	return null
