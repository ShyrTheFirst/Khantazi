extends Area2D

var current_map_coords : Vector2
@onready var tile_map = $TileMap

const trees = preload("res://Scenes and Scripts/Outside/trees.tscn")
const mines = preload("res://Scenes and Scripts/Outside/mines.tscn")

const tree_boss = preload("res://Scenes and Scripts/Outside/Bosses/tree_boss.tscn")


var tree_list : Array = []
var mine_list : Array = []
var current_map_resources : Dictionary = {"Tree":tree_list, "Mine":mine_list}


func save_position(coords):
	current_map_coords = coords

#Create a random map when it's initialized for the first time
#When defined what are the random map settings, save it to world save in a new dict
#Get the dict info like the boss, and then apply to the map every time it's called!
#Make a function? Or do it all in ready?

#I need to instantiate some trees and ores too... or maybe do it somehow different? Don't know yet
#Simple inventory system, wood, ore, plank, bar, wood handle, metal weapon, boss essence, boss essence weapon

#Your dream is to become the best forger in the world. that's all. You are in the middle of nowhere, forging
#every piece of wood and metal that comes to your hands. You want to be a legend and forge everything possible!

#How to progress : forge to unlock new weapons to forge. Every new forge unlock 3 new weapons up to a total of 13
#weapons (1 -> 3 -> 9 and that's all) 
# ------ first one, the three that come after that, the 9 that come after that three.
# You need to craft at least one of each, to highlight the weapon and show you learned about that.
#When you reach the last 9 weapon, you need to craft the 5 essence weapon, with boss essence that you gathered. 
#To make things hard, all bosses upgrade based on your level (aka how much you gathered, crafted and killed other bosses)
#So you can be overkilled by a boss because you gathered too much
#Boss drops essences everytime they are killed, but they are strong so you can't kill them without one of the last 30 weapons


func _ready():
	random_tile_selection() 
	
	if WorldSave.verify_map_exist(current_map_coords):
		var boss_info = WorldSave.retrieve_boss(current_map_coords)
		for key in boss_info:
			if boss_info[key][0]:
				match key:
					0:#tree
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords)
						add_child(boss)
					1:#stone
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords)
						add_child(boss)
					2:#mineral
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords)
						add_child(boss)
					3:#fire
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords)
						add_child(boss)
					4:#light
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords)
						add_child(boss)
	else:
		var boss_chance = randi_range(0,100)
		if boss_chance <= 25:
			generate_boss()

func generate_boss():
	if WorldSave.retrieve_map_type(current_map_coords) == 0:
		return
	var tiles : Array = tile_map.get_used_cells(0)
	var boss_tile = tiles.pick_random()
	var random_type = randi_range(0,4)
	match random_type:
		0:#tree
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords)
			add_child(boss)
		1:#stone
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords)
			add_child(boss)
		2:#mineral
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords)
			add_child(boss)
		3:#fire
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords)
			add_child(boss)
		4:#light
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords)
			add_child(boss)
	WorldSave.add_boss(current_map_coords, random_type, boss_tile)

func random_tile_selection():
	var pick_tile = 0

	if WorldSave.verify_map_type(current_map_coords):
		pick_tile = WorldSave.retrieve_map_type(current_map_coords)
	else:
		pick_tile = randi_range(0,4)
		WorldSave.add_map_type(current_map_coords, pick_tile)

	match pick_tile:
		0:#Grass
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(2,1), Vector2(2,0), Vector2(1,0)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)
			gen_collectables(tiles_used)
		1:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(5,0), Vector2(6,0), Vector2(4,3)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)
		2:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				tile_map.set_cell(0,i,4, Vector2(8,0), 0)
		3:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(12,0), Vector2(12,1), Vector2(12,3)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)
		4:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				tile_map.set_cell(0,i,4, Vector2(16,0), 0)

func gen_collectables(tiles):
	if WorldSave.verify_grass_map(current_map_coords):
		var resource_data = WorldSave.retrieve_grass_map(current_map_coords)
		for item in resource_data:
			match item:
				"Tree":
					for coords in resource_data["Tree"]:
						var place_tree = trees.instantiate()
						place_tree.position = coords * 32
						add_child(place_tree)
				"Mine":
					for coords in resource_data["Mine"]:
						var place_mine = mines.instantiate()
						place_mine.position = coords * 32
						add_child(place_mine)
	else:
		for i in tiles:
			var spawn_chance = randi_range(0,100)
			if spawn_chance < 20:
				var spawn_type = ["Tree", "Mine"]
				var choose_one = spawn_type.pick_random()
				match choose_one:
					"Tree":
						var place_tree = trees.instantiate()
						place_tree.position = i * 32
						add_child(place_tree)
						tree_list.append(i)
					"Mine":
						var place_mine = mines.instantiate()
						place_mine.position = i * 32
						add_child(place_mine)
						mine_list.append(i)
		current_map_resources["Tree"] = tree_list
		current_map_resources["Mine"] = mine_list
		WorldSave.add_grass_map(current_map_coords, current_map_resources)
