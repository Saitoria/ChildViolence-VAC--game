extends Node2D


func _ready():
	pass 


func _on_BackButton_pressed():
	get_tree().change_scene("res://LoginSreen.tscn")
	pass 


func _on_NextVideoButton_pressed():
	get_tree().change_scene("res://Level3b.tscn")
	pass 
