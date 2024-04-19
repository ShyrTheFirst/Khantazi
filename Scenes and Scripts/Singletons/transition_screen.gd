extends CanvasLayer

var next_scene : String 
var change_scene : bool = false
@onready var animation_player = $AnimationPlayer
@onready var background_music = $BackgroundMusic

var music_stopped : bool = true

var quitting : bool = false


func _process(_delta):
	if GameData.show_HUD:
		if music_stopped:
			background_music.play()
			music_stopped = false
	else:
		background_music.stop()
		music_stopped = true
		

func fade_in():
	animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		if !GameData.show_HUD:
			GameData.show_HUD = true
		else:
			GameData.show_HUD = false
		if change_scene:
			get_tree().change_scene_to_file(next_scene)
		
		if quitting:
			return
		animation_player.play("fade_out")
