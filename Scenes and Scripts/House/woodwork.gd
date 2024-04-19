extends StaticBody2D

@onready var panel = $Panel

const AUDIO_TEMPLATE = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")

func _on_cut_log_pressed(): #If all items OK
	if GameData.woods >= 10:
		print("can craft plank")#Play sawing sound
	else:
		print("Can't craft") #Play nope sound

func _on_craft_handler_pressed(): #If all items OK
	if GameData.plank >= 5:
		print("can craft handler")#Play sawing sound
	else:
		print("Can't craft") #Play nope sound

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		panel.visible = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		panel.visible = false
