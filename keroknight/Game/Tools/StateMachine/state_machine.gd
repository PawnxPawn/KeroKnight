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
	change_state(starting_state)

## new_state_name should be the same as the node name
#TODO: Find a better way to call the state node.
#NOTE: Use global const or enum for now.
func change_state(new_state: State) -> void:
	if not new_state:
		push_error("Current State: %s NOT FOUND" % new_state)
	
	if _current_state:
		_current_state.exit()
	
	_last_state = _current_state
	
	_current_state = new_state
	_current_state.enter()

#TODO: Implement On_Hit/Damage_Taken function for both State and state machine.
