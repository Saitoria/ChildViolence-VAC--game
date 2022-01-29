extends Node2D



var key
var interchanger 
var map = [[0,1,2],[3,4,5],[6,7,8]]
var solver = [] 
var imgNode = load("res://imgc.tscn") 
var img = []
var move = Vector2(0,0)
var speed = 4 #1,2,4
var inv_count = 0 

func _ready():
	inv_count = 0 
	randomize()
	for x in range(3):
		map[x].shuffle()

	for i in range(3):
		for j in range(3):
			print(map[i][j])


#	for i in range(0,2):
#		for j in range(i+1,3):
#			if (map[j][i]<8 and  map[j][i]>map[i][j]):
#				inv_count = inv_count+1

	for i in range(3):
		for j in range(3):
			solver.append(map[i][j])

	for i in range(8):
		for j in range(i+1,9):
			if(solver[i]!=8 and solver[j]!=8 and solver[i]>solver[j]):
				inv_count = inv_count+1
			else:
				pass
	
	print()
	print(inv_count)
	print()
	
	if(inv_count%2!=0):
		if map[0][0] == 8:
			interchanger = map[0][1]
			map[0][1] = map[0][2]
			map[0][2] = interchanger
		elif map[0][1] == 8:
				interchanger = map[0][0]
				map[0][0] = map[0][2]
				map[0][2] = interchanger
		else:
			interchanger = map[0][0]
			map[0][0] = map[0][1]
			map[0][1] = interchanger
		print("solvable")
	else:
		pass

	for i in range(3):
		for j in range(3):
			print(map[i][j])

	for n in range(9):
		img.append(imgNode.instance())
		img[n].set_frame(n)
		add_child(img[n])
		for y in range(3):
			if map[y].find(n) != -1:
#				print(map[y].find(n))
				img[n].set_position(Vector2(map[y].find(n)*100,y*100))
#	img.shuffle()
	print(img)
	img[8].hide()
	set_physics_process(true)


func step(key,dir):
	if  Input.is_key_pressed(key) and move == Vector2(0,0) or move == dir:
		for y in range(3):
			if map[y].find(8) != -1:
				var pos = Vector2(y,map[y].find(8))+ dir
				pos.x = min(max(pos.x,0),3)
				pos.y = min(max(pos.y,0),3)
				img[map[y][map[y].find(8)]].set_position(Vector2(pos.y*100,pos.x*100))
				if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(8)*100,y*100):
					move = dir
#					print(img[map[pos.x][pos.y]].get_position())
#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
					var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
					img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
				else:
					map[y][map[y].find(8)] = map[pos.x][pos.y]
					map[pos.x][pos.y] = 8
					move = Vector2(0,0)
					break
		

func _physics_process(delta):
	step(KEY_S,Vector2(-1,0))
	step(KEY_D,Vector2(0,-1))
	step(KEY_A,Vector2(0,1))
	step(KEY_W,Vector2(1,0))
	
	if map == [[0,1,2],[3,4,5],[6,7,8]]:
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://LoginSreen.tscn")
		if(Globals.puzzlechooser[0]==0):
			get_tree().change_scene("res://Level2b.tscn")
		elif(Globals.puzzlechooser[0]==1):
			get_tree().change_scene("res://Level2c.tscn")
		else:
			get_tree().change_scene("res://Level2.tscn")
		pass

func _input(event):
	if event is InputEventScreenDrag:
		if $TouchScreenClass.get_drag_direction(event.relative,20) == Vector2.DOWN:
			var dir = Vector2(-1,0)
			if  move == Vector2(0,0) or move == dir:
				for y in range(3):
					if map[y].find(8) != -1:
						var pos = Vector2(y,map[y].find(8))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(8)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(8)*100,y*100):
							move = dir
#							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(8)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 8
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,20) == Vector2.UP:
			var dir = Vector2(1,0)
			if  move == Vector2(0,0) or move == dir:
				for y in range(3):
					if map[y].find(8) != -1:
						var pos = Vector2(y,map[y].find(8))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(8)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(8)*100,y*100):
							move = dir
#							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(8)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 8
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,20) == Vector2.LEFT:
			var dir = Vector2(0,1)
			if  move == Vector2(0,0) or move == dir:
				for y in range(3):
					if map[y].find(8) != -1:
						var pos = Vector2(y,map[y].find(8))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(8)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(8)*100,y*100):
							move = dir
#							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(8)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 8
							move = Vector2(0,0)
							break
		if $TouchScreenClass.get_drag_direction(event.relative,20) == Vector2.RIGHT:
			var dir = Vector2(0,-1)
			if  move == Vector2(0,0) or move == dir:
				for y in range(3):
					if map[y].find(8) != -1:
						var pos = Vector2(y,map[y].find(8))+ dir
						pos.x = min(max(pos.x,0),3)
						pos.y = min(max(pos.y,0),3)
						img[map[y][map[y].find(8)]].set_position(Vector2(pos.y*100,pos.x*100))
						if img[map[pos.x][pos.y]].get_position() != Vector2(map[y].find(8)*100,y*100):
							move = dir
							print(img[map[pos.x][pos.y]].get_position())
		#					img[map[pos.x][pos.y]].set_position(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							var walk = Vector2(img[map[pos.x][pos.y]].get_position() - Vector2(dir.y*speed,dir.x*speed))
							img[map[pos.x][pos.y]].set_position(Vector2(walk.x,walk.y))
						else:
							map[y][map[y].find(8)] = map[pos.x][pos.y]
							map[pos.x][pos.y] = 8
							move = Vector2(0,0)
							break
		pass
	
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://LoginSreen.tscn")
	pass 
