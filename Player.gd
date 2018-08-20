extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200
const JUMP_SPEED = 100

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -JUMP_SPEED
	else:
		velocity.x = 0
		
	move_and_slide(velocity, Vector2(0, -1))
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
		$AnimatedSprite.play()
	elif velocity.y < 0: # TODO: Prevent double jump?
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.play()
	
	if velocity.x == 0:
		$AnimatedSprite.stop()
