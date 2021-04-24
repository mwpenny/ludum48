extends KinematicBody

var moveSpeed = 13.0
var velocity = Vector3.ZERO

func get_input():
	var input = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input.z += 1
	elif Input.is_action_pressed("move_backward"):
		input.z -= 1
	elif Input.is_action_pressed("move_left"):
		input.x += 1
	elif Input.is_action_pressed("move_right"):
		input.x -= 1
	
	return input.normalized()
	

func _physics_process(delta):	
	var input = get_input()
	var direction = ((transform.basis.z * input.z) + (transform.basis.x * input.x))
	
	velocity.x = direction.x * moveSpeed
	velocity.z = direction.z * moveSpeed
	
	velocity = move_and_slide(velocity, Vector3.UP)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
