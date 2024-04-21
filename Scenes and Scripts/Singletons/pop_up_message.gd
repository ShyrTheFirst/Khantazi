extends Marker2D

@onready var label = $Label
var set_text = "SAVED"

func _ready():
	label.text = set_text
