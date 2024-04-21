extends CanvasLayer

const audio_template = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")
@onready var looser_audio = $AudioStreamPlayer2D


func _ready():
	looser_audio.play()


func _on_audio_stream_player_2d_finished():
	GameData.replace_save("user://clean_save.tres")
	TransitionScreen.next_scene = "res://Scenes and Scripts/Menu/menu.tscn"
	TransitionScreen.change_scene = true
	TransitionScreen.fade_in()
