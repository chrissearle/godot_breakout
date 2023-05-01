extends StaticBody2D

@onready var brick: = $Sprite2D

func _ready() -> void:
	randomize()

	brick.modulate = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1), 1)

func hit() -> void:
	queue_free()
