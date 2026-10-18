extends Node
@onready var points_label: Label = %PointsLabel

var points = 0
var lives = 3

func decrease_lives():
	lives -= 1
	print(lives)
	if (lives == 0):
		get_tree().reload_current_scene()

func add_points():
	points += 1
	print(points)
	points_label.text = "Points: " + str(points)
