extends KinematicBody2D

const GRAVITY = 950
var velocity = Vector2.ZERO
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	# gravity
	pass
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)

