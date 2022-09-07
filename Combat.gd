extends Node

var server

func _ready():
	server = get_parent()

func receive_player_basic_attack(id, data):
	var d = {
		"I" : id,
		"A" : data.A,
		"P" : data.P
	}
	server.send_player_basic_attack(d)
