extends Node2D

var bubble = preload("res://Bubble.tscn")
var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()
export(int) var box_speed = 270
export var move_rate = 1
export var can_move = true
var direction = Vector2(0,+1)

func _ready():
	pass

func _process(delta):
	rng.randomize()
	var randNo = rng.randi_range(1, 7)
#	rng2.randomize()
#	var randNo2 = rng2.randi_range(0, 1)
#	Randomizer.obstacle = randNo2
	var  bubble_instance = bubble.instance()
	bubble_instance.position = Vector2((get_viewport().size.x/8)*randNo,0)
	bubble_instance.apply_impulse(Vector2(),Vector2(0,box_speed))
	
	if can_move:
		rng2.randomize()
		var randNo2 = rng2.randi_range(0, 1)
		Randomizer.obstacle = randNo2
		rng3.randomize()
		var randNo3 = rng3.randi_range(0, 2)
		Randomizer.obstacleSub = randNo3
		get_tree().get_root().add_child(bubble_instance)
		can_move = false
		yield(get_tree().create_timer(move_rate),"timeout")
		can_move = true
	pass
	
	
func _on_BackButton_pressed():
	var enemies = get_tree().get_nodes_in_group("bubbles")
	for enemy in enemies:
		enemy.queue_free()
	get_tree().change_scene("res://LoginSreen.tscn")

	pass 


func _on_Bubble_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("clicked")
		else:
			print("not clicked")
	pass # Replace with function body.
