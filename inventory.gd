extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var inventory = $ItemList

func _process(delta):
	if not get_parent().is_multiplayer_authority():
		return
	if Input.is_action_just_pressed("toggle_inventory"):
		inventory.visible = not inventory.visible
	if Input.is_action_just_pressed("inventory_down"):
		if not inventory.is_anything_selected():
			inventory.select(0)
		else: 
			inventory.select(inventory.get_selected_items()[0] + 1)
	if Input.is_action_just_pressed("inventory_up"):
		if not inventory.is_anything_selected():
			inventory.select(0)
		else:
			inventory.select(inventory.get_selected_items()[0] - 1)
