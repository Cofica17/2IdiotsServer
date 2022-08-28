extends Node

var network = NetworkedMultiplayerENet.new()
var port = 7769
var max_player = 2

var dict:Dictionary = {}

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

remote func fetch_player_transform(transform):
	var player_id = get_tree().get_rpc_sender_id()
	dict[player_id] = transform

func return_player_transform():
	var player_id = get_tree().get_rpc_sender_id()
	rpc_unreliable_id(0, "return_player_transform", dict)

func _physics_process(delta):
	return_player_transform()
