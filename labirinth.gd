extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if multiplayer.is_server():
		multiplayer.peer_connected.connect(_on_peer_connected)

func _on_peer_connected(id: int):
	var player = preload("res://Player.tscn").instantiate()
	player.name = str(id)  # Имя узла = ID пира, для authority
	player.set_multiplayer_authority(id)  # Этот игрок управляет собой
	$Players.add_child(player, true)  # force_readable_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
