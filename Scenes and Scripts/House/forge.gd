extends StaticBody2D

const audio_template = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")
const ANVIL_HIT = "res://Assets/SFX and Music/anvil_hit.wav"
const DENIED = "res://Assets/SFX and Music/denied.mp3"
const SMELTING = "res://Assets/SFX and Music/smelting.wav"



@onready var panel = $Panel

@onready var bars = $Panel/WeaponInfo/Bars
@onready var essence_1 = $Panel/WeaponInfo/Essence1
@onready var essence_2 = $Panel/WeaponInfo/Essence2
@onready var essence_3 = $Panel/WeaponInfo/Essence3
@onready var essence_4 = $Panel/WeaponInfo/Essence4
@onready var essence_5 = $Panel/WeaponInfo/Essence5
@onready var weapon_selection = $Panel/WeaponSelection
@onready var weapons = $Panel/WeaponSelection/Weapons

var selected_bar_quant : int = 0
var selected_essence1_quant : int = 0
var selected_essence2_quant : int = 0
var selected_essence3_quant : int = 0
var selected_essence4_quant : int = 0
var selected_essence5_quant : int = 0

func _ready():
	weapons.frame = 1
	$Panel/DownSelection/ArrowDown.text = str(InputMap.action_get_events("ArrowDown")[0].as_text())
	$Panel/UpSelection/ArrowUp.text = str(InputMap.action_get_events("ArrowUp")[0].as_text())
	$Panel/ForgeWeapon/Craft.text = str(InputMap.action_get_events("Craft")[0].as_text())
	$Panel/SmeltOres/Process.text = str(InputMap.action_get_events("Process")[0].as_text())

func _process(_delta):
	match weapons.frame:
		1:
			selected_bar_quant = 5
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		2:
			selected_bar_quant = 5
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		3:
			selected_bar_quant = 5
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		4:
			selected_bar_quant = 10
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		5:
			selected_bar_quant = 10
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		6:
			selected_bar_quant = 10
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		7:
			selected_bar_quant = 20
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		8:
			selected_bar_quant = 15
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		9:
			selected_bar_quant = 7
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		10:
			selected_bar_quant = 7
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		11:
			selected_bar_quant = 7
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		12:
			selected_bar_quant = 20
			selected_essence1_quant = 0
			selected_essence2_quant = 0
			selected_essence3_quant = 0
			selected_essence4_quant = 0
			selected_essence5_quant = 0
		13:
			selected_bar_quant = 45
			selected_essence1_quant = 1
			selected_essence2_quant = 1
			selected_essence3_quant = 1
			selected_essence4_quant = 1
			selected_essence5_quant = 1
		14:
			selected_bar_quant = 50
			selected_essence1_quant = 5
			selected_essence2_quant = 5
			selected_essence3_quant = 5
			selected_essence4_quant = 5
			selected_essence5_quant = 5
		15:
			selected_bar_quant = 50
			selected_essence1_quant = 10
			selected_essence2_quant = 10
			selected_essence3_quant = 10
			selected_essence4_quant = 10
			selected_essence5_quant = 10
		16:
			selected_bar_quant = 75
			selected_essence1_quant = 10
			selected_essence2_quant = 10
			selected_essence3_quant = 10
			selected_essence4_quant = 10
			selected_essence5_quant = 10
		17:
			selected_bar_quant = 100
			selected_essence1_quant = 50
			selected_essence2_quant = 50
			selected_essence3_quant = 50
			selected_essence4_quant = 50
			selected_essence5_quant = 50

	bars.text = str(selected_bar_quant)
	essence_1.text = str(selected_essence1_quant)
	essence_2.text = str(selected_essence2_quant)
	essence_3.text = str(selected_essence3_quant)
	essence_4.text = str(selected_essence4_quant)
	essence_5.text = str(selected_essence5_quant)

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		panel.visible = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		panel.visible = false

func _on_down_selection_pressed(): #change weapon show
	if weapons.frame > 1:
		weapons.frame -= 1

func _on_up_selection_pressed(): #change weapon show
	if weapons.frame < 17:
		weapons.frame += 1

func _on_forge_weapon_pressed():
	if GameData.weapon_hander_created >= 1 and GameData.bar >= selected_bar_quant and GameData.Essence1 >= selected_essence1_quant and GameData.Essence2 >= selected_essence2_quant and GameData.Essence3 >= selected_essence3_quant and GameData.Essence4 >= selected_essence4_quant and GameData.Essence5 >= selected_essence5_quant:
		GameData.weapon_hander_created -= 1
		GameData.bar -= selected_bar_quant
		GameData.Essence1 -= selected_essence1_quant
		GameData.Essence2 -= selected_essence2_quant
		GameData.Essence3 -= selected_essence3_quant
		GameData.Essence4 -= selected_essence4_quant
		GameData.Essence5 -= selected_essence5_quant

		play_sound(ANVIL_HIT)

		match weapons.frame:
			1:
				GameData.frame1_created += 1
			2:
				GameData.frame2_created += 1
			3:
				GameData.frame3_created += 1
			4:
				GameData.frame4_created += 1
			5:
				GameData.frame5_created += 1
			6:
				GameData.frame6_created += 1
			7:
				GameData.frame7_created += 1
			8:
				GameData.frame8_created += 1
			9:
				GameData.frame9_created += 1
			10:
				GameData.frame10_created += 1
			11:
				GameData.frame11_created += 1
			12:
				GameData.frame12_created += 1
			13:
				GameData.frame13_created += 1
			14:
				GameData.frame14_created += 1
			15:
				GameData.frame15_created += 1
			16:
				GameData.frame16_created += 1
			17:
				GameData.frame17_created += 1
	else:
		play_sound(DENIED)

func _on_smelt_ores_pressed():
	if GameData.ore >= 8:
		play_sound(SMELTING)
		GameData.ore -= 8
		GameData.bar += 1
	else:
		play_sound(DENIED)

func play_sound(sfx_file):
	var audio = audio_template.instantiate()
	audio.sfx_to_play = sfx_file
	add_child(audio)
