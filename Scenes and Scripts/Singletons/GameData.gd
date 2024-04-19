extends Node

const DATA_SAVER = preload("res://Scenes and Scripts/Singletons/data_saver.tres")

#Create inventory
var woods : int = 0
var ore : int = 0
var plank : int = 0
var bar : int = 0
var Essence1 : int = 0
var Essence2 : int = 0
var Essence3 : int = 0
var Essence4 : int = 0
var Essence5 : int = 0

var player_HP : int = 10

var show_HUD : bool = false

var created_weapons : int = 0
var frame1_created : int = 0
var frame2_created : int = 0
var frame3_created : int = 0
var frame4_created : int = 0
var frame5_created : int = 0
var frame6_created : int = 0
var frame7_created : int = 0
var frame8_created : int = 0
var frame9_created : int = 0
var frame10_created : int = 0
var frame11_created : int = 0
var frame12_created : int = 0
var frame13_created : int = 0
var frame14_created : int = 0
var frame15_created : int = 0
var frame16_created : int = 0
var frame17_created : int = 0

var player_damage : int = 1

var boss_health : int = 10 * created_weapons
#handle save game

func change_player_damage(value):
	player_damage = value + created_weapons

func save_game():
	pass
