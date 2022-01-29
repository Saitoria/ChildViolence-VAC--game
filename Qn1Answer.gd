extends Sprite

onready var selector = [0,1]

func _ready():

	self.texture = load(Randomizer.qimagea[Randomizer.level1image])
	pass 

func _process(delta):
	if(Randomizer.selector[0] == 0):
		self.texture = load(Randomizer.qimagea[Randomizer.level1image])
	else:
		self.texture = load(Randomizer.qimageb[Randomizer.level1image])
	pass


