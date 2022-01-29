extends Node2D

func _ready():
	pass 


func _on_Level1Btn_pressed():
	Globals.levelchooser = 1
	get_tree().change_scene("res://LevelStartup.tscn")
	pass 


func _on_Level2Btn_pressed():
	Globals.levelchooser = 2
	get_tree().change_scene("res://LevelStartup.tscn")
	randomize()
	Globals.puzzlechooser.shuffle()
	pass 


func _on_Level3Btn_pressed():
	Globals.levelchooser = 3
	get_tree().change_scene("res://LevelStartup.tscn")
	pass 


func _on_Level4Btn_pressed():
	Globals.levelchooser = 4
	get_tree().change_scene("res://LevelStartup.tscn")
	pass 

func _on_Level5Btn_pressed():
	Globals.levelchooser = 5
	get_tree().change_scene("res://LevelStartup.tscn")
	pass 

func _on_MoreInfoBtn_pressed():
	pass 



