extends Node2D


func _ready():
	Randomizer.level1image=0
	pass 

func _process(delta):
	if Randomizer.level1image >=  5:
		yield(get_tree().create_timer(20),"timeout")
		get_tree().change_scene("res://LoginSreen.tscn") 
	pass
	
	
	
	
func _on_TouchButton1_pressed():
	get_tree().get_root().get_node("Level1/Control/Answer/Mark1").show()
	get_tree().get_root().get_node("Level1/Control/Alt_answer/Mark2").show()
	yield(get_tree().create_timer(2),"timeout")
	randomize()
	Randomizer.selector.shuffle()
	Randomizer.level1image = Randomizer.level1image + 1
	get_tree().get_root().get_node("Level1/Control/Answer/Mark1").hide()
	get_tree().get_root().get_node("Level1/Control/Alt_answer/Mark2").hide()
	pass


func _on_TouchButton2_pressed():
	get_tree().get_root().get_node("Level1/Control/Answer/Mark1").show()
	get_tree().get_root().get_node("Level1/Control/Alt_answer/Mark2").show()
	yield(get_tree().create_timer(2),"timeout")
	randomize()
	Randomizer.selector.shuffle()
	Randomizer.level1image = Randomizer.level1image + 1
	get_tree().get_root().get_node("Level1/Control/Answer/Mark1").hide()
	get_tree().get_root().get_node("Level1/Control/Alt_answer/Mark2").hide()
	pass 


func _on_BackButton_pressed():
	get_tree().change_scene("res://LoginSreen.tscn")
	pass 
