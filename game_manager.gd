extends Node
@onready var points_label: Label = %PointsLabel
@onready var bananas: Label = %Bananas

var points = 0
var banana = 0
var max_bananas = 8
var max_cherries = 56

func add_cherries():
	points += 1
	print(points)
	points_label.text = "        " + str(points)
	
func add_bananas():
	banana += 1
	print(banana)
	bananas.text = "        " + str(banana) 

func _process(delta: float) -> void:
	if banana == max_bananas:
		get_tree().change_scene_to_file("res://scenes/bonus.tscn")
	#elif points == max_cherries:
		#get_tree().change_scene_to_file()
