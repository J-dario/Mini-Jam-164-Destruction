extends Node2D

@onready var button = $Button
@onready var sprite_2d = $Sprite2D
@onready var label = $Label
var transferID
var selected = false


func connectID(id):
	transferID = id
	label.text = str(transferID)
	sprite_2d.region_rect.position.y = 0
	selected = false

func _on_button_pressed():
	if selected == false:
		sprite_2d.region_rect.position.y = 90
		selected = true
	else:
		sprite_2d.region_rect.position.y = 0
		selected = false
		
func deselect():
	sprite_2d.region_rect.position.y = 0
	selected = false
