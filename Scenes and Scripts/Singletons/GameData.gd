extends Node

const DATA_SAVER = preload("res://Scenes and Scripts/Singletons/data_saver.tres")

var selected_weapon : int = 0

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

var weapon_hander_created : int = 0
var created_weapons : int = 1
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

func change_player_damage(value : int):
	player_damage = value + created_weapons

func save_game(save_path = "user://data_save.tres"):
	var all_vars = {"woods":woods, "ore":ore, "plank":plank, "bar":bar,
	"Essence1":Essence1, "Essence2":Essence2, "Essence3":Essence3, "Essence4":Essence4, "Essence5":Essence5,
	"player_HP":player_HP, "weapon_hander_created":weapon_hander_created,
	"created_weapons":created_weapons, "frame1_created":frame1_created, "frame2_created":frame2_created,
	"frame3_created":frame3_created, "frame4_created":frame4_created, "frame5_created":frame5_created,
	"frame6_created":frame6_created, "frame7_created":frame7_created, "frame8_created":frame8_created,
	"frame9_created":frame9_created, "frame10_created":frame10_created, "frame11_created":frame11_created,
	"frame12_created":frame12_created, "frame13_created":frame13_created, "frame14_created":frame14_created, 
	"frame15_created":frame15_created, "frame16_created":frame16_created, "frame17_created":frame17_created, 
	"player_damage":player_damage, "boss_health":boss_health, "WorldSave.loaded_coords":WorldSave.loaded_coords,
	"WorldSave.data_in_chunk":WorldSave.data_in_chunk, "WorldSave.maps_info":WorldSave.maps_info,
	"WorldSave.maps_type":WorldSave.maps_type, "WorldSave.grass_map_info":WorldSave.grass_map_info, 
	"selected_weapon":selected_weapon }

	DATA_SAVER.save_the_game(all_vars, save_path)

func load_game(save_path = "user://data_save.tres"):
	if FileAccess.file_exists("user://data_save.tres"):
		var data_loaded = DATA_SAVER.load_data(save_path)
		WorldSave.loaded_coords = data_loaded["WorldSave.loaded_coords"]
		WorldSave.data_in_chunk = data_loaded["WorldSave.data_in_chunk"]
		WorldSave.maps_info = data_loaded["WorldSave.maps_info"]
		WorldSave.maps_type = data_loaded["WorldSave.maps_type"]
		WorldSave.grass_map_info = data_loaded["WorldSave.grass_map_info"]
		player_HP = data_loaded["player_HP"]
		selected_weapon = data_loaded["selected_weapon"]
		woods = data_loaded["woods"]
		ore = data_loaded["ore"]
		plank = data_loaded["plank"]
		bar = data_loaded["bar"]
		Essence1= data_loaded["Essence1"]
		Essence2 = data_loaded["Essence2"]
		Essence3 = data_loaded["Essence3"]
		Essence4 = data_loaded["Essence4"]
		Essence5 = data_loaded["Essence5"]
		player_HP = data_loaded["player_HP"]
		weapon_hander_created = data_loaded["weapon_hander_created"]
		created_weapons = data_loaded["created_weapons"]
		frame1_created = data_loaded["frame1_created"]
		frame2_created = data_loaded["frame2_created"]
		frame3_created = data_loaded["frame3_created"]
		frame4_created = data_loaded["frame4_created"]
		frame5_created = data_loaded["frame5_created"]
		frame6_created = data_loaded["frame6_created"]
		frame7_created = data_loaded["frame7_created"]
		frame8_created = data_loaded["frame8_created"]
		frame9_created = data_loaded["frame9_created"]
		frame10_created = data_loaded["frame10_created"]
		frame11_created = data_loaded["frame11_created"]
		frame12_created = data_loaded["frame12_created"]
		frame13_created = data_loaded["frame13_created"]
		frame14_created = data_loaded["frame14_created"]
		frame15_created = data_loaded["frame15_created"]
		frame16_created = data_loaded["frame16_created"]
		frame17_created = data_loaded["frame17_created"]
		player_damage = data_loaded["player_damage"]
		boss_health = data_loaded["boss_health"]
	
func replace_save(save_path):
	var data_loaded = DATA_SAVER.load_data(save_path)
	DATA_SAVER.save_the_game(data_loaded)
