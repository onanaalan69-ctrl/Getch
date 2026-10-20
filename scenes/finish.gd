extends Area2D
@onready var game_manager: Node = %GameManager
@export var target_level : PackedScene

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D") && (game_manager.points > 15):
		get_tree().change_scene_to_packed(target_level)
	else:
		print("Access denied")
