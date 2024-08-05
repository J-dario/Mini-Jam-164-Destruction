extends Node

var complaintsScore = 0
var shreddedScore = 0
var phoneScore = 0
var stampScore = 0
var totalScore = 0
var level = 1
var strikes = 0

var game
var player
var character 
var label
var wrongBar

func setGame(games):
	game = games

func setUI(UI):
	player = UI
	character = UI.character
	label = UI.label
	wrongBar = UI.wrong

func increaseScore():
	totalScore += 1
	if totalScore == 10:
		player.promote()
		game.promote()
	elif totalScore == 20:
		player.promote()
		game.promote()
	elif totalScore == 30:
		player.promote()
		game.promote()
	elif totalScore == 45:
		player.promote()
		game.promote()
	elif totalScore == 55:
		player.promote()
		game.promote()

func wrong():
	strikes += 1
	player.strike()
	if strikes == 3:
		get_tree().change_scene_to_file("res://scenes/lose.tscn")
