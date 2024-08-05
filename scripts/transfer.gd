extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var label = $Label
@onready var button = $Button
var transferID

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_down():
	sprite_2d.region_rect.position.y = 65

func _on_button_button_up():
	sprite_2d.region_rect.position.y = 0

func setID(id):
	transferID = id
	label.text = str(transferID)
