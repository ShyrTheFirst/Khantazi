extends Node2D

@export var player_path : NodePath
var player

const chunk_node = preload("res://Scenes and Scripts/Outside/chunk_node.tscn")
const house_node = preload("res://Scenes and Scripts/House/house.tscn")

@export var render_distance : int = 2
@export var chunk_size : int = 1024
var current_chunk : Vector2 = Vector2()
var previous_chunk : Vector2 = Vector2()
var chunk_loaded : bool = false

@onready var active_coord : Array = []
@onready var active_chunks : Array = []


func _ready():
	player = get_node(player_path)
	current_chunk = _get_player_chunk($Player.global_position)
	load_chunk()

func _process(_delta):
	current_chunk = _get_player_chunk($Player.global_position)
	if previous_chunk != current_chunk:
		if !chunk_loaded:
			load_chunk()
	else:
		chunk_loaded = false
	previous_chunk = current_chunk

func _get_player_chunk(pos):
	var chunk_pos = Vector2()
	chunk_pos.y = int(pos.y/chunk_size)
	chunk_pos.x = int(pos.x/chunk_size)
	if pos.x < 0:
		chunk_pos.x -= 1
	if pos.y < 0:
		chunk_pos.y -= 1
	return chunk_pos

func load_chunk():
	var render_bounds = (float(render_distance)*1.0)+1.0
	var loading_coord = []

	for x in range(render_bounds):
		for y in range(render_bounds):
			var _x  = (x+1) - (round(render_bounds/2.0)) + current_chunk.x
			var _y  = (y+1) - (round(render_bounds/2.0)) + current_chunk.y

			var chunk_coords = Vector2(_x, _y)
			loading_coord.append(chunk_coords)

			if WorldSave.loaded_coords.find(chunk_coords) == -1:
				var chunk = chunk_node.instantiate()
				chunk.first_time = true
				chunk.set_position(chunk_coords * chunk_size)
				chunk.save_position(chunk_coords)
				active_chunks.append(chunk)
				active_coord.append(chunk_coords)
				WorldSave.add_chunk(chunk_coords,1)
				add_child(chunk)

			else:
				var data = WorldSave.retrive_data(chunk_coords)
				match data:
					1:
						var chunk = chunk_node.instantiate()
						chunk.first_time = false
						chunk.set_position(chunk_coords * chunk_size)
						chunk.save_position(chunk_coords)
						active_chunks.append(chunk)
						active_coord.append(chunk_coords)
						add_child(chunk)
					2:
						var chunk = house_node.instantiate()
						chunk.set_position(chunk_coords * chunk_size)
						chunk.save_position(chunk_coords)
						active_chunks.append(chunk)
						active_coord.append(chunk_coords)
						add_child(chunk)

	var deleting_chunks = []
	for x in active_coord:
		if loading_coord.find(x) == -1:
			deleting_chunks.append(x)
	for x in deleting_chunks:
		var index = active_coord.find(x)
		active_chunks[index].queue_free()
		active_chunks.remove_at(index)
		active_coord.remove_at(index)

	chunk_loaded = true
