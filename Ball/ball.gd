extends RigidBody2D

var velocity: = Vector2.ZERO

@export var speed: = 200
@export var maxSpeed: = 400
@export var speedUp: = 5

@onready var blip: = $Blip
@onready var hit: = $Hit

func _ready() -> void:
	velocity = Vector2.ONE * speed


func _process(delta: float) -> void:
	var collision: = move_and_collide(velocity * delta)

	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		
		if collision.get_collider().is_in_group("brick"):
			collision.get_collider().hit()
			hit.play()
		elif collision.get_collider().is_in_group("paddle"):
			var paddlePos = collision.get_collider().global_position
			var ballPos = global_position
			var direction = (ballPos - paddlePos).normalized()
			speed = min(speed + speedUp, maxSpeed)
			velocity = direction * speed
			blip.play()
		else:
			blip.play()
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().reload_current_scene()
