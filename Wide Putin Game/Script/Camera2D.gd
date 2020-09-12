extends Camera2D

#get global node
onready var global = get_node("/root/Global")

func _physics_process(delta):
#set the camera height position to be on the player position
	position.y = global.playerPos.y
