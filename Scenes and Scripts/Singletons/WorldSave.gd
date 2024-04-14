extends Node

var loaded_coords = []
var data_in_chunk = []
var maps_info = {}

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
	var boss_type_and_state = maps_info[map_coords]
	return boss_type_and_state

func verify_map_exist(pos):
	for key in maps_info:
		if key == pos:
			return true
