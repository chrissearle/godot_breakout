extends Node2D

@onready var brick: = preload("res://Brick/brick.tscn")


func load_brick(i: int, j: int) -> void:
	var brick_instance = brick.instantiate()
	brick_instance.position = Vector2(85+40*(j),70+20*i)
	add_child(brick_instance)
	

func _ready() -> void:
	for i in range (5):
		for j in range(13):
			load_brick(i, j)
			
		
