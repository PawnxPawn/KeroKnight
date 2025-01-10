## State Machine used to control current state the parent node is in.
## To use add new state as a child to the StateMachine Node
## In parent Node call .init(self) or any node you want it to be the parent of
class_name StateMachine extends Node

@export var starting_state:State ## State that will be initialized on play

var _state_list:Array[State] # Stores all the children states of state machine
#NOTE: Is there away I can use this to call state changes instead?
var get_state_list:Array[State]:
	get:
		return _state_list
var _current_state = null
var get_current_state: State:
	get:
		return _current_state
var _last_state = null
var get_last_state: State:
	get:
		return _last_state

# Initialize all states to an array and set parent equal to the node that called init then sets inital state
func init(parent:Character) -> void:
	for child in get_children():
		if child is State:
			_state_list.push_back(child)
			child.parent = parent
	change_state(starting_state.name)

## new_state_name should be the same as the node name
#TODO: Find a better way to call the state node.
#NOTE: Use global const or enum for now.
func change_state(new_state_name: String) -> void:
	var new_state = find_state(new_state_name)
	if not new_state:
		push_error("Current State: %s NOT FOUND" % new_state_name)
	
	if _current_state:
		_current_state.exit()
	
	_last_state = _current_state
	
	_current_state = new_state
	_current_state.enter()

# Pass through functions for the Characters
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

# Helper Functions 

#TEST: Alternatives for faster searching to handle larger state machines. O(n)
func find_state(state_search:String) -> State:
	for state in _state_list:
		if state.name == state_search:
			return state
	return null

#TODO: Implement On_Hit/Damage_Taken function for both State and state machine.
