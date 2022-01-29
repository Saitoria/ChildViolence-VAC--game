extends Node

onready var selector = [0,1]

var answermark = ["res://Assets/icons/cross.png","res://Assets/icons/tik.png"]
var level1image = 1
var qimagea = ["res://Assets/Qn1/qn1a.png","res://Assets/Qn1/qn2a.png","res://Assets/Qn1/qn3a.png","res://Assets/Qn1/qn4a.png","res://Assets/Qn1/qn5a.png"]
var qimageb = ["res://Assets/Qn1/qn1b.png","res://Assets/Qn1/qn2b.png","res://Assets/Qn1/qn3b.png","res://Assets/Qn1/qn4b.png","res://Assets/Qn1/qn5b.png"]

var obstacle = 0
var obstacleSub = 0
onready var bubble = ["res://Assets/Bubble_anim/Bubble_good.png","res://Assets/Bubble_anim/Bubble_bad.png"];
onready var bubble_good = ["Furaha","Kazi","Wazazi"]
onready var bubble_bad = ["Ukatili","Kuonewa","Kupigwa"]

func _ready():
	randomize()
	qimagea.shuffle();
	qimageb.shuffle();
	pass 
