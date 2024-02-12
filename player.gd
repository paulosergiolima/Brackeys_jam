extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	look_at(get_global_mouse_position())
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left","right", "up", "down")
	velocity = direction * SPEED
	

	move_and_slide()
func _input(event):
	if event is InputEventMouseButton:
		var sword = $sword
		var area2d = $sword/Area2D/CollisionShape2D
		area2d.disabled = false
		for n in 10:
			print(n)
			await get_tree().create_timer(0.01).timeout
			sword.rotation = sword.rotation - 0.1
		for n in 20:
			await get_tree().create_timer(0.01).timeout
			sword.rotation = sword.rotation + 0.1
		for n in 10:
			await get_tree().create_timer(0.01).timeout
			sword.rotation = sword.rotation - 0.1
