extends AudioStreamPlayer2D


var sfx_to_play : String = ""

func _ready():
	stream = load(sfx_to_play)
	play()

func _on_finished():
	queue_free()

