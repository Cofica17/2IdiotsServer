extends Node

onready var movement = $Movement

var network = NetworkedMultiplayerENet.new()
var port = 7769
var max_player = 2

func _ready():
	start_server()

func start_server():
	network.create_server(port, max_player)
	get_tree().set_network_peer(network)
	print("Server started")
	
	network.connect("peer_connected", self, "_peer_connected")
	network.connect("peer_disconnected", self, "_peer_disconnected")

func _peer_connected(player_id):
	print("user connected: " + str(player_id))

func _peer_disconnected(player_id):
	print("user disconnected: " + str(player_id))


##############
### REMOTE ###
##############

remote func receive_player_transform(data):
	movement.receive_player_transform(data)

remote func receive_player_animation(anim):
	movement.receive_player_animation(anim)


########################
### FOR SENDING INFO ###
########################

func send_world_state(world_state):
	rpc_unreliable_id(0, "receive_world_state", world_state)

func send_player_animation(data):
	rpc_id(0, "receive_player_animation", data)
