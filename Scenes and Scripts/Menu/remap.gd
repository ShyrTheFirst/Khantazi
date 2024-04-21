extends CanvasLayer

@onready var audio = $Audio

@onready var menu = $GridContainer/Menu_Name/Menu
@onready var attack = $GridContainer/Attack_Name/Attack
@onready var up = $GridContainer/Up_Name/Up
@onready var down = $GridContainer/Down_Name/Down
@onready var left = $GridContainer/Left_Name/Left
@onready var right = $GridContainer/Right_Name/Right
@onready var process = $GridContainer/Process_Name/Process
@onready var craft = $GridContainer/Craft_Name/Craft
@onready var arrow_up = $GridContainer/ArrowUp_Name/ArrowUp
@onready var arrow_down = $GridContainer/ArrowDown_Name/ArrowDown
@onready var _1 = $"GridContainer/1_Name/1"
@onready var _2 = $"GridContainer/2_Name/2"
@onready var _3 = $"GridContainer/3_Name/3"
@onready var _4 = $"GridContainer/4_Name/4"
@onready var _5 = $"GridContainer/5_Name/5"
@onready var _6 = $"GridContainer/6_Name/6"
@onready var _7 = $"GridContainer/7_Name/7"
@onready var _8 = $"GridContainer/8_Name/8"
@onready var _9 = $"GridContainer/9_Name/9"

var event_pressed : String
var selected_button

func _ready():
	if AudioServer.is_bus_mute(0):
		audio.button_pressed = true
		audio.text = "AUDIO : OFF"
	else:
		audio.button_pressed = false
		audio.text = "AUDIO : ON"

	set_process_unhandled_input(false)

	menu.text = str(InputMap.action_get_events("Menu")[0].as_text())
	attack.text = str(InputMap.action_get_events("Attack")[0].as_text())
	up.text = str(InputMap.action_get_events("Up")[0].as_text())
	down.text = str(InputMap.action_get_events("Down")[0].as_text())
	left.text = str(InputMap.action_get_events("Left")[0].as_text())
	right.text = str(InputMap.action_get_events("Right")[0].as_text())
	process.text = str(InputMap.action_get_events("Process")[0].as_text())
	craft.text = str(InputMap.action_get_events("Craft")[0].as_text())
	arrow_up.text = str(InputMap.action_get_events("ArrowUp")[0].as_text())
	arrow_down.text = str(InputMap.action_get_events("ArrowDown")[0].as_text())
	_1.text = str(InputMap.action_get_events("1")[0].as_text())
	_2.text = str(InputMap.action_get_events("2")[0].as_text())
	_3.text = str(InputMap.action_get_events("3")[0].as_text())
	_4.text = str(InputMap.action_get_events("4")[0].as_text())
	_5.text = str(InputMap.action_get_events("5")[0].as_text())
	_6.text = str(InputMap.action_get_events("6")[0].as_text())
	_7.text = str(InputMap.action_get_events("7")[0].as_text())
	_8.text = str(InputMap.action_get_events("8")[0].as_text())
	_9.text = str(InputMap.action_get_events("9")[0].as_text())

func _process(_delta):
	if AudioServer.is_bus_mute(0):
		audio.button_pressed = true
		audio.text = "AUDIO : OFF"
	else:
		audio.button_pressed = false
		audio.text = "AUDIO : ON"

	menu.text = str(InputMap.action_get_events("Menu")[0].as_text())
	attack.text = str(InputMap.action_get_events("Attack")[0].as_text())
	up.text = str(InputMap.action_get_events("Up")[0].as_text())
	down.text = str(InputMap.action_get_events("Down")[0].as_text())
	left.text = str(InputMap.action_get_events("Left")[0].as_text())
	right.text = str(InputMap.action_get_events("Right")[0].as_text())
	process.text = str(InputMap.action_get_events("Process")[0].as_text())
	craft.text = str(InputMap.action_get_events("Craft")[0].as_text())
	arrow_up.text = str(InputMap.action_get_events("ArrowUp")[0].as_text())
	arrow_down.text = str(InputMap.action_get_events("ArrowDown")[0].as_text())
	_1.text = str(InputMap.action_get_events("1")[0].as_text())
	_2.text = str(InputMap.action_get_events("2")[0].as_text())
	_3.text = str(InputMap.action_get_events("3")[0].as_text())
	_4.text = str(InputMap.action_get_events("4")[0].as_text())
	_5.text = str(InputMap.action_get_events("5")[0].as_text())
	_6.text = str(InputMap.action_get_events("6")[0].as_text())
	_7.text = str(InputMap.action_get_events("7")[0].as_text())
	_8.text = str(InputMap.action_get_events("8")[0].as_text())
	_9.text = str(InputMap.action_get_events("9")[0].as_text())
	

func on_release(action, new_action):
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, new_action)
	selected_button.button_pressed = false
	set_process_unhandled_input(false)

func _unhandled_input(event):
	if event.is_pressed():
		on_release(event_pressed, event)

func _on_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = menu
	event_pressed = "Menu"

func _on_attack_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = attack
	event_pressed = "Attack"

func _on_up_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = up
	event_pressed = "Up"

func _on_down_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = down
	event_pressed = "Down"

func _on_left_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = left
	event_pressed = "Left"

func _on_right_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = right
	event_pressed = "Right"

func _on_process_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = process
	event_pressed = "Process"

func _on_craft_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = craft
	event_pressed = "Craft"

func _on_arrow_up_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = arrow_up
	event_pressed = "ArrowUp"

func _on_arrow_down_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = arrow_down
	event_pressed = "ArrowDown"

func _on_1_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _1
	event_pressed = "1"

func _on_2_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _2
	event_pressed = "2"

func _on_3_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _3
	event_pressed = "3"

func _on_4_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _4
	event_pressed = "4"

func _on_5_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _5
	event_pressed = "5"

func _on_6_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _6
	event_pressed = "6"

func _on_7_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _7
	event_pressed = "7"

func _on_8_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _8
	event_pressed = "8"

func _on_9_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	selected_button = _9
	event_pressed = "9"

func _on_quit_pressed():
	queue_free()

func _on_audio_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)
