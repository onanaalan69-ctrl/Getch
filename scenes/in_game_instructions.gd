extends Node
@onready var panel_2: Panel = %Panel2
@onready var panel_3: Panel = %Panel3
@onready var panel_4: Panel = %Panel4

var current_instruction: int = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel_2.show()
	panel_3.hide()
	panel_4.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pass"):
		instruction_swap()
	
func instruction_swap() -> void:
	if current_instruction == 2:
			panel_2.hide()
			panel_3.show()
			panel_4.hide()
			current_instruction = 3
			
	elif current_instruction == 3:
			panel_2.hide()
			panel_3.hide()
			panel_4.show()
			current_instruction = 4
			
	elif  current_instruction == 4:
			panel_4.hide()
