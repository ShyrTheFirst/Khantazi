extends StaticBody2D

var map_coords : Vector2
var object_pos : Vector2i
var item_type : String = "Tree"

func _on_area_2d_area_entered(area):
	if area.name == "PlayerAttackArea":
		taken_damage()

func taken_damage():
	WorldSave.remove_item_from_map(map_coords, object_pos, item_type)
	GameData.woods += 1
	queue_free()
