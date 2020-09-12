extends KinematicBody2D

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer
onready var global = get_node("/root/Global")

enum {
	LEFT,
	MIDDLE,
	RIGHT
}

var pos = MIDDLE

var state = "WALKING"

#set the player position in the middle
func _ready():
	position.x = 160

#for controlling the player state of moving direction and running walkin animation
#also for setting walking speed and calling move() function
#and also updating the player position to global singletons
func _physics_process(delta):
	animationPlayer.play("Walkin")
	
	
	if Input.is_action_just_pressed("ui_left"):
		state = "MOVE_LEFT"
	
	if Input.is_action_just_pressed("ui_right"):
		state = "MOVE_RIGHT"
	
	velocity.y = 100
	
	move()
	
	
	
	global.playerPos = position
	
	print(state)
	print(global.playerPos.y)

#this will tell when player when to stop moving according to their location
#for example: LEFT MIDDLE RIGHT
#also it's run the move_and_slide
func move():
	match pos:
		LEFT:
			if state == "MOVE_RIGHT" && position.x < 160:
				velocity.x = 150
			elif position.x >= 160:
				pos = MIDDLE
				velocity.x = 0
				state = "WALKING"
		MIDDLE:
			if state == "MOVE_RIGHT" && position.x < 250:
				velocity.x = 150
			elif position.x >= 260:
				pos = RIGHT
				velocity.x = 0
				state = "WALKING"
			
			if state == "MOVE_LEFT" && position.x > 60:
				velocity.x = -150
			elif position.x <= 60:
				pos = LEFT
				velocity.x = 0
				state = "WALKING"
		RIGHT:
			if state == "MOVE_LEFT" && position.x > 160:
				velocity.x = -150
			elif position.x <= 160:
				pos = MIDDLE
				velocity.x = 0
				state = "WALKING"
	
	move_and_slide(velocity)



func _on_Area2D_area_entered(area):
	pass
