extends StaticBody2D

@onready var brick: = $Sprite2D


func hit() -> void:
	queue_free()
