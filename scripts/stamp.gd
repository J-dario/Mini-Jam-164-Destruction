extends Node2D

@onready var sprite_2d = $Sprite2D
var paper
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _on_area_2d_area_entered(area):
	paper = area

func _on_area_2d_area_exited(area):
	paper = null

func _on_button_button_up():
	sprite_2d.region_rect.position.x = 0
	
func _on_button_button_down():
	audio_stream_player_2d.play()
	sprite_2d.region_rect.position.x = 126
	if paper != null and paper.stampable == 1:
		paper.stamped()
