extends StaticBody2D

@onready var panel = $Panel

const audio_template = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")
const SAWING_WOOD = "res://Assets/SFX and Music/sawing wood.wav"
const DENIED = "res://Assets/SFX and Music/denied.mp3"

func _ready():
	$Panel/CutLog/Process.text = str(InputMap.action_get_events("Process")[0].as_text())
	$Panel/CraftHandler/Craft.text = str(InputMap.action_get_events("Craft")[0].as_text())

func _on_cut_log_pressed():
	if GameData.woods >= 10:
		play_sound(SAWING_WOOD)
		GameData.woods -= 10
		GameData.plank += 1
	else:
		play_sound(DENIED)

func _on_craft_handler_pressed():
	if GameData.plank >= 5:
		play_sound(SAWING_WOOD)
		GameData.plank -= 5
		GameData.weapon_hander_created += 1
	else:
		play_sound(DENIED)

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		panel.visible = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		panel.visible = false

func play_sound(sfx_file):
	var audio = audio_template.instantiate()
	audio.sfx_to_play = sfx_file
	add_child(audio)
