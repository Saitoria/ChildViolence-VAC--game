extends Sprite


func _ready():
	self.texture = load(Randomizer.answermark[0])
	pass 

func _process(delta):
	if(Randomizer.selector[0]==0):
		self.texture = load(Randomizer.answermark[1])
	else:
		self.texture = load(Randomizer.answermark[0])
	pass
