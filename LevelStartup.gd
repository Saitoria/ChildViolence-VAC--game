extends Node2D

onready var timer = get_node("Control/Timer")

func _ready():
	get_node("Control/LevelNumberLabel").text = str(Globals.levelchooser)
	timer.set_wait_time(2)
	timer.start()
	pass 


func _on_Timer_timeout():
	if Globals.levelchooser == 1:
		get_tree().change_scene("res://Level1.tscn")
	elif Globals.levelchooser == 2:
		if(Globals.puzzlechooser[0]==0):
			get_tree().change_scene("res://Level2.tscn")
		elif(Globals.puzzlechooser[0]==1):
			get_tree().change_scene("res://Level2b.tscn")
		else:
			get_tree().change_scene("res://Level2c.tscn")
	elif Globals.levelchooser == 3:
		get_tree().change_scene("res://Level3.tscn")
	else:
		get_tree().change_scene("res://Level4.tscn")
	timer.stop()
#	get_tree().get_root().get_node("res://LevelStartup.tscn").queue_free()
	pass 
