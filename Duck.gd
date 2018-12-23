extends KinematicBody2D


var velocity = Vector2()
var speed_mult = 1
const MAXSPEED = 150
const JUMP_HEIGHT = -350
const GRAVITY = 1500
const LEFT_SHIFT = 16777237


func _physics_process(delta):
	#Gravity
	velocity.y += GRAVITY * delta
	#Jump
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_HEIGHT
	
	#Sprint
	if Input.is_key_pressed(LEFT_SHIFT):
		speed_mult = 3
	else:
		speed_mult = 1
	
	#Movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = MAXSPEED*speed_mult
		$Sprite.flip_h = false
		$Sprite.play("Run")
	
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -MAXSPEED*speed_mult
		$Sprite.flip_h = true
		$Sprite.play("Run")

	else:
		velocity.x = 0
		$Sprite.play("Idle")
	
	velocity = move_and_slide(velocity,Vector2(0,-1))



	
func _on_Spikes_body_entered(body):
	if body.get_name() == "Duck":
		global.deaths = global.deaths + 1
		get_tree().change_scene("Death.tscn")


#func _on_Timer_timeout():
#get_tree().reload_current_scene()


func _on_OutSideScreen_body_entered(body):
	if body.get_name() == "Duck":
		global.deaths = global.deaths + 1
		get_tree().change_scene("Death.tscn")
	
