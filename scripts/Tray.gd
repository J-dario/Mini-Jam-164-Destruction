extends Area2D

var id
@onready var button_s_1 = $EX1/ButtonS1
@onready var sprite_s_2 = $EX1/SpriteS2
@onready var button_s_3 = $EX2/ButtonS3
@onready var sprite_s_3 = $EX2/SpriteS3
@onready var sprite_2d = $Sprite2D
@onready var ex_1 = $EX1
@onready var ex_2 = $EX2
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var audio_stream_player_2d_2 = $AudioStreamPlayer2D2

func _on_area_entered(area):
	audio_stream_player_2d.play()
	if Score.level == 1:
		area.tray(1)
	else:
		if id == area.traySolution:
			area.tray(1)
		else:
			area.tray(0)
	area.global_position.x = global_position.x + 100
	area.global_position.y = global_position.y - 100

func _on_button_1_button_down():
	audio_stream_player_2d_2.play()
	button_s_1.region_rect.position.x = 43
	sprite_2d.region_rect.position.x = 136
	id = 2

func _on_button_1_button_up():
	button_s_1.region_rect.position.x = 0

func _on_button_2_button_down():
	audio_stream_player_2d_2.play()
	sprite_s_2.region_rect.position.x = 43
	sprite_2d.region_rect.position.x = 272
	id = 1

func _on_button_2_button_up():
	sprite_s_2.region_rect.position.x = 0


func _on_button_3_button_down():
	audio_stream_player_2d_2.play()
	button_s_3.region_rect.position.x = 43
	sprite_2d.region_rect.position.x = 544
	id = 3

func _on_button_3_button_up():
	button_s_3.region_rect.position.x = 0


func _on_button_4_button_down():
	audio_stream_player_2d_2.play()
	sprite_s_3.region_rect.position.x = 43
	sprite_2d.region_rect.position.x = 408
	id = 4

func _on_button_4_button_up():
	sprite_s_3.region_rect.position.x = 0
