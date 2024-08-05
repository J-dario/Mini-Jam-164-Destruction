extends Area2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _on_area_entered(area):
	audio_stream_player_2d.play()
	area.shred()
	area.global_position.x = global_position.x
	area.global_position.y = global_position.y
