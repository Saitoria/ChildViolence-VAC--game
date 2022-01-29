extends Sprite

var iscorrect = true

func _ready():
	self.texture = load(Randomizer.answermark[0])
	pass 

func _process(delta):
	if(Randomizer.selector[0]==0):
		self.texture = load(Randomizer.answermark[0])
	else:
		self.texture = load(Randomizer.answermark[1])
	pass
