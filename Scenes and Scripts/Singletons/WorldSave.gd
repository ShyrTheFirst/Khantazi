extends Node

var loaded_coords = []
var data_in_chunk = []
var maps_info = {}
var maps_type = {}
var grass_map_info = {}

func _ready():
	maps_info[Vector2(0,0)] = {}
	loaded_coords.append(Vector2(0,0))
	data_in_chunk.append(2)

func add_chunk(coords,data):
	loaded_coords.append(coords)
	data_in_chunk.append(data)

func retrive_data(coords):
	var data = data_in_chunk[loaded_coords.find(coords)]
	return data

func add_boss(map_coords, boss_type, boss_pos):
	if not maps_info.has(map_coords):
		maps_info[map_coords] = {boss_type : [false, Vector2(0,0)]}
		maps_info[map_coords][boss_type] = [true, boss_pos] #define if boss is alive

func kill_boss(map_coords, boss_type, boss_state = false):
	maps_info[map_coords][boss_type] = boss_state

func retrieve_boss(map_coords):
	return maps_info[map_coords]

func verify_map_exist(pos):
	for key in maps_info:
		if key == pos:
			return true

func add_map_type(map_coords, type_value):
	if not maps_type.has(map_coords):
		maps_type[map_coords] = type_value

func retrieve_map_type(map_coords):
	return maps_type[map_coords]

func verify_map_type(pos):
	for key in maps_type:
		if key == pos:
			return true

func add_grass_map(map_coords, resources):
	if not grass_map_info.has(map_coords):
		grass_map_info[map_coords] = resources

func retrieve_grass_map(map_coords):
	return grass_map_info[map_coords]

func verify_grass_map(map_coords):
	for key in grass_map_info:
		if key == map_coords:
			return true
