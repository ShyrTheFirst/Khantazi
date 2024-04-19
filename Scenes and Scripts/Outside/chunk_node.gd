extends Area2D

var current_map_coords : Vector2
@onready var tile_map = $TileMap

const trees = preload("res://Scenes and Scripts/Outside/trees.tscn")
const mines = preload("res://Scenes and Scripts/Outside/mines.tscn")

const tree_boss = preload("res://Scenes and Scripts/Outside/Bosses/tree_boss.tscn")
const ore_boss = preload("res://Scenes and Scripts/Outside/Bosses/ore_boss.tscn")
const stone_boss = preload("res://Scenes and Scripts/Outside/Bosses/stone_boss.tscn")
const dark_boss = preload("res://Scenes and Scripts/Outside/Bosses/dark_boss.tscn")
const light_boss = preload("res://Scenes and Scripts/Outside/Bosses/light_boss.tscn")

var tree_list : Array = []
var mine_list : Array = []
var current_map_resources : Dictionary = {"Tree":tree_list, "Mine":mine_list}


func save_position(coords):
	current_map_coords = coords



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
						boss.receive_info(current_map_coords, tile_map.get_used_cells(0))
						add_child(boss)
					1:#stone
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords, tile_map.get_used_cells(0))
						add_child(boss)
					2:#mineral
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords, tile_map.get_used_cells(0))
						add_child(boss)
					3:#fire
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords, tile_map.get_used_cells(0))
						add_child(boss)
					4:#light
						var boss = tree_boss.instantiate()
						boss.position = boss_info[key][1] * 32
						boss.receive_info(current_map_coords, tile_map.get_used_cells(0))
						add_child(boss)
	else:
		var boss_chance = randi_range(0,100)
		if boss_chance <= 25:
			generate_boss()

func generate_boss():
	if WorldSave.retrieve_map_type(current_map_coords) == 2:
		return

	var tiles : Array = tile_map.get_used_cells(0)
	var boss_tile = tiles.pick_random()
	var random_type = randi_range(0,4)
	match random_type:
		0:#tree
			var boss = tree_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords, tiles)
			add_child(boss)
		1:#ore
			var boss = ore_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords, tiles)
			add_child(boss)
		2:#stone
			var boss = stone_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords, tiles)
			add_child(boss)
		3:#dark
			var boss = dark_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords, tiles)
			add_child(boss)
		4:#light
			var boss = light_boss.instantiate()
			boss.position = boss_tile * 32
			boss.receive_info(current_map_coords, tiles)
			add_child(boss)
			
	WorldSave.add_boss(current_map_coords, random_type, boss_tile)

func random_tile_selection():
	var pick_tile = 0

	if WorldSave.verify_map_type(current_map_coords):
		pick_tile = WorldSave.retrieve_map_type(current_map_coords)
	else:
		pick_tile = randi_range(0,3)
		WorldSave.add_map_type(current_map_coords, pick_tile)

	match pick_tile:
		0:#Grass
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(2,1), Vector2(2,0), Vector2(1,0)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)
		1:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(5,0), Vector2(6,0), Vector2(4,3)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)
		2:#FOREST
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				tile_map.set_cell(0,i,4, Vector2(8,0), 0)
			gen_collectables(tiles_used)
		3:
			var tiles_used = tile_map.get_used_cells(0)
			for i in tiles_used:
				var tiles_possibilities = [Vector2(12,0), Vector2(12,1), Vector2(12,3)]
				var pick_random_tile = tiles_possibilities.pick_random()
				tile_map.set_cell(0,i,4, pick_random_tile, 0)

func gen_collectables(tiles):
	if WorldSave.verify_grass_map(current_map_coords):
		var resource_data = WorldSave.retrieve_grass_map(current_map_coords)
		for list in resource_data:
			for item in resource_data[list]:
				match list:
					"Tree":
						if item[1]:
							var place_tree = trees.instantiate()
							place_tree.position = item[0] * 32
							add_child(place_tree)
					"Mine":
						if item[1]:
							var place_mine = mines.instantiate()
							place_mine.position = item[0] * 32
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
						place_tree.map_coords = current_map_coords
						place_tree.object_pos = i
						place_tree.position = i * 32
						add_child(place_tree)
						tree_list.append([i, true])
					"Mine":
						var place_mine = mines.instantiate()
						place_mine.object_pos = i
						place_mine.map_coords = current_map_coords
						place_mine.position = i * 32
						add_child(place_mine)
						mine_list.append([i, true])
		current_map_resources["Tree"] = tree_list
		current_map_resources["Mine"] = mine_list
		WorldSave.add_grass_map(current_map_coords, current_map_resources)
