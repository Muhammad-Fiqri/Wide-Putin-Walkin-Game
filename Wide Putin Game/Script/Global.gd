extends Node2D

const box = preload("res://Box.tscn")
var playerPos = Vector2.ZERO
var timerout = false

func _process(delta):
	print(timerout)


func _on_Timer_timeout():
	var boxingame = box.instance()
	get_node("YSort").add_child(boxingame)
	timerout = true
