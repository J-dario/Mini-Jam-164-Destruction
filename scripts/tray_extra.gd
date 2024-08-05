extends Node2D

@onready var button_1s = $Button1S
@onready var button_2s = $Button2S
@onready var tray = $Tray

func make(num):
	pass

func _on_button_1_button_down():
	button_1s.region_rect.position.x = 43
	tray.region_rect.position.x = 136

func _on_button_1_button_up():
	button_1s.region_rect.position.x = 0

func _on_button_2_button_down():
	button_2s.region_rect.position.x = 43
	tray.region_rect.position.x = 272

func _on_button_2_button_up():
	button_2s.region_rect.position.x = 0
