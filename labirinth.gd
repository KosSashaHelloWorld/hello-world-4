extends Node2D

@onready var spawner: MultiplayerSpawner = $MultiplayerSpawner

func _ready() -> void:
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(_spawn_player)
		# spawn for the host itself
		_spawn_player(multiplayer.get_unique_id())

func _spawn_player(id: int) -> void:
	var player := preload("res://Player.tscn").instantiate()
	player.name = str(id)
	player.set_multiplayer_authority(id) 
	add_child(player, true)
