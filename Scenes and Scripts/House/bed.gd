extends StaticBody2D

@onready var panel = $Panel
var player_reference

const AUDIO_TEMPLATE = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		player_reference = body
		panel.visible = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		panel.visible = false


func _on_save_game_pressed(): #save
	pass # Replace with function body.

func _on_weapon_tree_pressed(): #open tree with all weapons and quantity crafted and pass player_reference
	pass # Replace with function body.
