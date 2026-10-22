extends Node

const PORT := 7777
const MAX_CLIENTS := 4

var peer: ENetMultiplayerPeer

func host_game() -> void:
	peer = ENetMultiplayerPeer.new()
	var err := peer.create_server(PORT, MAX_CLIENTS)
	if err != OK:
		push_error("Не удалось создать сервер: %d" % err)
		return
	multiplayer.multiplayer_peer = peer
	print("Сервер запущен на порту %d" % PORT)

func join_game(address: String) -> void:
	peer = ENetMultiplayerPeer.new()
	var err := peer.create_client(address, PORT)
	if err != OK:
		push_error("Не удалось подключиться: %d" % err)
		return
	multiplayer.multiplayer_peer = peer
	print("Подключение к %s:%d" % [address, PORT])
