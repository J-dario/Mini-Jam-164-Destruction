extends Label

func _process(delta):
	self.text = str(Score.totalScore)
