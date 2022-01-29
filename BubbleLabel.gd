extends Label


func _ready():
	if(Randomizer.obstacle== 0):
		self.text = str(Randomizer.bubble_good[Randomizer.obstacleSub])
	else:
		self.text = str(Randomizer.bubble_bad[Randomizer.obstacleSub])
	pass 

