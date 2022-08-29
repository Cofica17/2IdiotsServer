extends Node

var world_state:Dictionary = {}

func _physics_process(delta):
	get_parent().send_world_state(prepare_world_state())

func prepare_world_state():
	var data:Dictionary = world_state.duplicate(true)
	for key in data:
		data[key].erase("T")
	
	data["T"] = OS.get_system_time_msecs()
	
	return data

func receive_player_transform(data):
	var player_id = get_tree().get_rpc_sender_id()
	
	if world_state.has(player_id):
		if world_state[player_id]["T"] < data["T"]:
			world_state[player_id] = data
	else:
		world_state[player_id] = data.duplicate(true)
