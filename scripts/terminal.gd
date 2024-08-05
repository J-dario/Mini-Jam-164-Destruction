extends Node2D

@onready var phone = $Phone
@onready var phone_2 = $Phone2
@onready var transfer = $Transfer
@onready var transfer_2 = $Transfer2
@onready var transfer_3 = $Transfer3
@onready var transfer_4 = $Transfer4
var selectedDisplay
@onready var timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var audio_stream_player_2d_2 = $AudioStreamPlayer2D2

func _ready():
	transfer.setID(1)
	transfer_2.setID(2)
	transfer_3.setID(3)
	transfer_4.setID(4)
	
	phone.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			phone_2.deselect()
			if selectedDisplay == phone:
				selectedDisplay = null
			else:
				selectedDisplay = phone
	)
	phone_2.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			phone.deselect()
			if selectedDisplay == phone_2:
				selectedDisplay = null
			else:
				selectedDisplay = phone_2
	)
	
	transfer.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			if selectedDisplay != null:
				if selectedDisplay.transferID == transfer.transferID:
					Score.increaseScore()
					Score.phoneScore  += 1
					selectedDisplay.connectID(0)
					selectedDisplay = null
					timer.start()
				else:
					Score.wrong()
	)
	
	transfer_2.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			if selectedDisplay != null:
				if selectedDisplay.transferID == transfer_2.transferID:
					Score.increaseScore()
					Score.phoneScore  += 1
					selectedDisplay.connectID(0)
					selectedDisplay = null
					timer.start()
				else:
					Score.wrong()
	)
	
	transfer_3.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			if selectedDisplay != null:
				if selectedDisplay.transferID == transfer_3.transferID:
					Score.increaseScore()
					Score.phoneScore  += 1
					selectedDisplay.connectID(0)
					selectedDisplay = null
					timer.start()
				else:
					Score.wrong()
	)
	
	transfer_4.button.pressed.connect(
		func():
			audio_stream_player_2d_2.play()
			if selectedDisplay != null:
				if selectedDisplay.transferID == transfer_4.transferID:
					Score.increaseScore()
					Score.phoneScore  += 1
					selectedDisplay.connectID(0)
					selectedDisplay = null
					timer.start()
				else:
					Score.wrong()
	)

func spawn():
	phone.connectID(randi_range(1,4))
	phone_2.connectID(randi_range(1,4))

func _on_timer_timeout():
	spawn()
	audio_stream_player_2d.play()
