extends Area2D

@onready var paper = $Paper
@onready var stamp_marker = $Paper/StampMarker
@onready var animation_player = $AnimationPlayer
@onready var label = $Paper/Label
const YES = preload("res://scenes/yes.tscn")

# Drag and Drop
var dragging = false
var of = Vector2(0,0)

# Text arrays
var invalidComplaints = [
	"The weather was bad when \nI visited your store.",
	"The traffic was terrible!",
	"I don't like cat food",
	"The store decoration \ndidn’t match my outfit.",
	"Smelly stinky smell smell",
	"A",
	"Catoogle images of cats",
	"meow meow meow meow meow \nmeow meow meow",
	"Turn around.",
	"my tummy so big"
	]

var hrComplaints = [
	"Meow from accounting was \nvery rude to me.",
	"Customer service staff are \nignoring my issue!",
	"John from accounting \ndiscriminated against me."
	]
	
var foodComplaints = [
	"The food was stale right \nout of the packaging!",
	"Bits of plastic mixed in \nwith the food???",
	"Incorrect labelling on \npackage almost gave my son \nan allergic reaction!"
]

var itComplaints = [
	"Your website keeps \nglitching out.", 
	"The mobile app keeps \ncrashing!",
	"Several account problems, \nplease help!"
	]
	
var accountingComplaints = [
	"I was promised a refund \nbut I never got it.",
	"I was charged twice for \nthe same order!",
	"I was charged more than \nthe listed price!"
]
var complaints = [invalidComplaints, hrComplaints, foodComplaints, itComplaints, accountingComplaints]

var stampSolution
var shredSolution
var traySolution
var stampable = 0
var valid = ["Eat yummy food and sleep", "Earn a bajillion dollars", "Tuna and yarn party"]
var invalid = ["Spend money with no return", "Destroy headquarters", "Layoff entire company"]

var RNG = RandomNumberGenerator.new()

func _ready():
	if Score.level == 5:
		stampable = RNG.randi_range(0, 1)
	var variation = RNG.randi_range(0, 4)
	
	if stampable == 1:
		paper.region_rect.position.y = 0
		paper.region_rect.position.x = 240*variation
		
		stampSolution = RNG.randi_range(0, 1)
		if stampSolution == 1:
			label.text = valid[RNG.randi_range(0, 2)]
		else:
			shredSolution = 1
			label.text = invalid[RNG.randi_range(0, 2)]
	else:
		paper.region_rect.position.y = 289
		paper.region_rect.position.x = 240*variation

		if Score.level < 4:
			shredSolution = RNG.randi_range(0, 1)
		else:
			shredSolution = RNG.randi_range(0, 2)
		
		if shredSolution == 1:
			label.text = complaints[0][RNG.randi_range(0, 9)]
		else:
			if Score.level < 4:
				traySolution = RNG.randi_range(1, 2)
			else:
				traySolution = RNG.randi_range(1, 4)
			label.text = complaints[traySolution][RNG.randi_range(0, 2)]

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - of

func _on_draggable_button_down():
	dragging = true
	move_to_front()
	rotation_degrees = 0
	of = get_global_mouse_position() - global_position

func _on_draggable_button_up():
	dragging = false

func shred():
	if shredSolution == 1:
		Score.increaseScore()
		Score.shreddedScore += 1
	else:
		Score.wrong()
		
	dragging = false
	animation_player.play("shred")

func tray(right):
	if shredSolution == 1 or stampSolution == 1:
		Score.wrong()
	else:
		if right:
			Score.increaseScore()
			Score.complaintsScore += 1
		else:
			Score.wrong()
		
	dragging = false
	animation_player.play("tray")
	rotation_degrees = -90
	
func stamped():
	if stampSolution == 1:
		Score.increaseScore()
		Score.stampScore += 1
	else:
		Score.wrong()
	
	var instance = YES.instantiate()
	instance.position = stamp_marker.position
	paper.add_child(instance)
	animation_player.play("new_animation")
