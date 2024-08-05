extends Node2D

const PAPER = preload("res://scenes/paper.tscn")
@onready var paper_spawn = $PaperSpawn
@onready var paper_container = $PaperContainer
@onready var button = $Button
@onready var label_2 = $Label2
@onready var tray = $Tray
@onready var stamp = $Stamp
@onready var terminal = $Terminal
@onready var timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var audio_stream_player_2d_2 = $AudioStreamPlayer2D2


var level = 1

func reset():
	get_tree().reload_current_scene()

func _ready():
	Score.setGame(self)
	spawnPapers()
	
	Score.complaintsScore = 0
	Score.shreddedScore = 0
	Score.phoneScore = 0
	Score.stampScore = 0
	Score.totalScore = 0
	Score.level = 1
	Score.strikes = 0
	terminal.hide()
	stamp.hide()


func _on_timer_timeout():
	spawnPapers()

func spawnPapers():
	audio_stream_player_2d.play()
	for i in range(5):
		randomize()
		var instance = PAPER.instantiate()
		instance.global_position = paper_spawn.global_position
		instance.rotation_degrees = randi_range(-15,15)
		paper_container.add_child(instance)

func promote():
	level += 1
	if level == 2:
		audio_stream_player_2d_2.play()
		tray.ex_1.show()
		label_2.text = "You've been promoted to Manager!\nNow you need to escalate the complaints to the right department!\n Click the buttons to choose where to send each form!"
		button.show()
		Engine.time_scale = 0
	elif level == 3:
		audio_stream_player_2d_2.play()
		terminal.show()
		timer.wait_time = 10
		label_2.text = "You've been promoted to Executive!\nNow you need to direct phone complaints to the right department!\n Click the button on the terminals to select them.\nMatch the numbers on the big terminal with the little ones!"
		button.show()
		Engine.time_scale = 0
	elif level == 4:
		audio_stream_player_2d_2.play()
		tray.ex_2.show()
		label_2.text = "You've been promoted to Director!\nNow you need to escalate the complaints to the right department!\n Click the buttons to choose where to send each form!"
		button.show()
		Engine.time_scale = 0
	elif level == 5:
		audio_stream_player_2d_2.play()
		stamp.show()
		label_2.text = "You've been promoted to CEO!\nNow you need approve or shred \nprojects that come in!\n Drag the paper under the stamp and hit the button to approve the porject!\nMake sure not to apporve any harmful projects."
		button.show()
		Engine.time_scale = 0

func _on_button_pressed():
	Engine.time_scale = 1
	label_2.text = ""
	button.hide()
