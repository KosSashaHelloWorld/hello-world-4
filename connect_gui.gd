extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# В скрипте главной сцены
func _on_host_button_pressed():
	NetworkManager.host_game()

func _on_join_button_pressed():
	NetworkManager.join_game($VBoxContainer/IPInput.text)  # $IPInput — LineEdit
