extends Area2D

var current_map_coords : Vector2
@onready var tile_map = $TileMap

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

#How to progress : forge to unlock new weapons to forge. Every new forge unlock 3 new weapons up to a total of 43
#weapons (1 -> 3 -> 9 -> 30 and that's all) 
# ------ first one, the three that come after that, the 9 that come after that three and the 30 that come after.
# You need to craft at least one of each, to highlight the weapon and show you learned about that.
#When you reach the last 30 weapon, you need to craft the 5 essence weapon, with boss essence that you gathered. 
#To make things hard, all bosses upgrade based on your level (aka how much you gathered, crafted and killed other bosses)
#So you can be overkilled by a boss because you gathered too much
#Boss drops essences everytime they are killed, but they are strong so you can't kill them without one of the last 30 weapons


func _ready():
	randomize()
	if WorldSave.verify_map_exist(current_map_coords):
		#if it exists,
		var boss_info = WorldSave.retrieve_boss(current_map_coords)
		print(current_map_coords, " My boss info: ", boss_info) # { type : [isAlive, pos]}
		#I need to instantiate the boss here
	else:
		var boss_chance = randi_range(0,100)
		if boss_chance <= 25:
			generate_boss()

func generate_boss():
	var tiles : Array = tile_map.get_used_cells(0)
	var boss_tile = tiles.pick_random()
	var random_type = randi_range(0,5)
	#I need to instantiate a boss here too
	WorldSave.add_boss(current_map_coords, random_type, boss_tile)
