extends Sprite

#get global node
onready var global = get_node("/root/Global")

func _ready():
#	set the position of the box when entering the scene to be
#	210 down of the player position
	position.y = global.playerPos.y + 210
	
#	generate random number from 1 to 3 and set the box position
#	according to that number
	var positionx = randi() % 3 + 1
	match positionx:
		1:
			position.x = 60
		2:
			position.x = 160
		3:
			position.x = 260

func _process(delta):
#	if the position of the box is now upper 210 of the player current position
#	it will delete the box for performance
	if position.y < global.playerPos.y - 210:
		queue_free()

