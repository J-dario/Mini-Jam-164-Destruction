extends Node2D

@onready var label_2 = $Label2

func _ready():
	label_2.text = "Complaints Escalated: " + str(Score.complaintsScore) + "\nPapers Shredded: " + str(Score.shreddedScore) + "\nCalls Connected: " + str(Score.phoneScore) + "\nProjects Approved: " + str(Score.stampScore) 

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
