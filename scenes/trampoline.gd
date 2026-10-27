extends StaticBody2D

var bounce_velocity = -800.00
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D") and body.velocity.y > 0:
		body.velocity.y = -2000
		animated_sprite_2d.animation = "propulse"
		print("Boing")
	
