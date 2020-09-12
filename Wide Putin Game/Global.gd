extends Node2D
#this script is a singletons

const box = preload("res://Scenes/Box.tscn")
var playerPos = Vector2.ZERO
var timerout = false

#for debugging cuz im not sure if 1.5 sec is a good delay
func _process(delta):
	print(timerout)

#instance the box the i just load and add it as the child of Ysort
#so player will look in front of the box when under it
func _on_Timer_timeout():
	var boxingame = box.instance()
	get_node("YSort").add_child(boxingame)
	timerout = true
