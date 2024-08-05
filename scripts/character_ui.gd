extends Node2D

@onready var character = $Character
@onready var wrong = $Wrong
@onready var label = $Label
var level = 1

func _ready():
	Score.setUI(self)
	
func strike():
	wrong.region_rect.position.x += 78

func promote():
	level += 1
	Score.level += 1
	if level == 2:
		character.region_rect.position.x += 78
		label.text = "Manager"
	elif level == 3:
		character.region_rect.position.x += 78
		label.text = "Executive"
	elif level == 4:
		character.region_rect.position.x += 78
		label.text = "Director"
	elif level == 5:
		character.region_rect.position.x += 78
		label.text = "CEO"
