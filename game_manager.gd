extends Node
@onready var points_label: Label = %PointsLabel
@onready var bananas: Label = %Bananas

var points = 0
var banana = 0
var lives = 3

func decrease_lives():
	lives -= 1
	print(lives)
	if (lives == 0):
		get_tree().reload_current_scene()

func add_cherries():
	points += 1
	print(points)
	points_label.text = "Points: " + str(points)
	
func add_bananas():
	banana += 1
	print(banana)
	bananas.text = "Bananas: " + str(banana) 
	
	
