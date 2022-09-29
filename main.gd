extends Control

var multiplayer_peer = ENetMultiplayerPeer.new()

func _on_start_pressed():
	multiplayer_peer.create_server(
		$Menu/PortInput.text.to_int(),
		$Menu/MaxPlayersInput.text.to_int()
	)
	multiplayer.multiplayer_peer = multiplayer_peer
	multiplayer_peer.peer_connected.connect(func(id): add_player_character(id))
	$Menu.visible = false

func add_player_character(id=1):
	var character = preload("res://player_character/player_character.tscn").instantiate()
	character.name = str(id)
	add_child(character)
