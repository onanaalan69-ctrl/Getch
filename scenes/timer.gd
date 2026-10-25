extends Panel

@onready var label: Label = %Label
@onready var timer: Timer = %Timer
@onready var finish: Area2D = %Finish
@onready var intro_text: Panel = %"Intro text"
@onready var end_text: Panel = %"End text"

var finished : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	intro_text.show()
	end_text.hide()
	timer.stop()
	timer.timeout.connect(_on_timer_timeout)
	finish.body_entered.connect(_on_finished_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pass"):
		intro_text.hide()
		timer.start(30)
	if not timer.is_stopped():
		var time_left = timer.get_time_left()
		label.text = "%04.1f s" % time_left
	if Input.is_action_just_pressed("space") and timer.is_stopped():
			get_tree().change_scene_to_file("res://scenes/level2.tscn")

func _on_timer_timeout() -> void:
	if not finished:
		print("Did not go fast enough. Try again...")
		intro_text.show()
		if Input.is_action_just_pressed("pass"):
			get_tree().reload_current_scene()

func _on_finished_body_entered(body: Node) -> void:
	if body.name == "CharacterBody2D":
		timer.stop()
		end_text.show()
		print("You finished in time!")
