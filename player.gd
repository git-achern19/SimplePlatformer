extends KinematicBody2D

const GRAVITY = 1500
const MAX_SPEED = 300
const ACCEL = 500
const FRICTION = 1300
const JUMP = 600

var velocity = Vector2.ZERO


onready var anim = $AnimatedSprite


func _ready():
	anim.play("idle")
	
	
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		anim.play("idle")
		
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = -JUMP
		print("you are jumping")
	if not is_on_floor():
		anim.play("jump")
		
		
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
