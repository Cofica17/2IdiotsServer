extends Node

var world_state:Dictionary = {}
var server

func _ready():
	server = get_parent()

func _physics_process(delta):
	server.send_world_state(prepare_world_state())

func prepare_world_state():
	var data:Dictionary = world_state.duplicate(true)
	for key in data:
		data[key].erase("T")
	
	data["T"] = OS.get_system_time_msecs()
	
	return data

func receive_player_info(player_id, data):
	if world_state.has(player_id):
		if world_state[player_id]["T"] < data["T"]:
			world_state[player_id] = data
	else:
		world_state[player_id] = data.duplicate(true)

func receive_player_animation(id, anim):
	var data := {
		"I" : id,
		"A" : anim
	}
	server.send_player_animation(data)
