extends StaticBody2D

@onready var panel = $Panel
var player_reference

const audio_template = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")
const WEAPON_TREE = preload("res://Scenes and Scripts/PlayerCharacter/weapon_tree.tscn")
const POP_UP_MESSAGE = preload("res://Scenes and Scripts/Singletons/pop_up_message.tscn")

func _ready():
	$Panel/WeaponTree/Process.text = str(InputMap.action_get_events("Process")[0].as_text())
	$Panel/SaveGame/Craft.text = str(InputMap.action_get_events("Craft")[0].as_text())

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		player_reference = body
		panel.visible = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		panel.visible = false


func _on_save_game_pressed(): #save
	GameData.save_game()
	var pop_up = POP_UP_MESSAGE.instantiate()
	add_child(pop_up)

func _on_weapon_tree_pressed():
	var weapon_tree = WEAPON_TREE.instantiate()
	get_tree().paused = true
	add_child(weapon_tree)

func play_sound(sfx_file):
	var audio = audio_template.instantiate()
	audio.sfx_to_play = sfx_file
	add_child(audio)
