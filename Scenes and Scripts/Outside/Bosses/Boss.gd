extends CharacterBody2D

var current_map : Vector2

func receive_info(self_map):
	current_map = self_map

#When moving, change position in WorldSave using -> position / 32 (because it multiply when instantiate)
