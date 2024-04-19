extends CanvasLayer


const game_scene = "res://Scenes and Scripts/Outside/outside.tscn"
var disableButtons : bool = false

@onready var start_fire = $Start_fire

@onready var start = $VBoxContainer/Start
@onready var load_button = $VBoxContainer/Load
@onready var quit = $VBoxContainer/Quit

@onready var v_box_container = $VBoxContainer
var isLoading : bool = false

@onready var quit_sound = $QuitSound
@onready var start_sound = $StartSound
@onready var load_sound = $LoadSound
@onready var background_menu_music = $BackgroundMenuMusic


func _ready():
	GameData.show_HUD = false

func _process(delta):
	start.disabled = disableButtons
	load_button.disabled = disableButtons
	quit.disabled = disableButtons
	
	if isLoading:
		#play door animation
		var tween = create_tween()
		tween.tween_property(v_box_container, "position", Vector2(500,350), 0.5)
		if v_box_container.scale > Vector2(0,0):
			v_box_container.scale -= Vector2(delta,delta)
		else:
			background_menu_music.stop()
			TransitionScreen.next_scene = game_scene
			TransitionScreen.change_scene = true
			TransitionScreen.fade_in()
		

func _on_start_pressed():
	GameData.player_HP = 10
	disableButtons = true
	TransitionScreen.next_scene = game_scene
	start_fire.emitting = true
	start_sound.play()

func _on_load_pressed():
	disableButtons = true
	isLoading = true
	load_sound.play()

func _on_quit_pressed():
	TransitionScreen.quitting = true
	TransitionScreen.fade_in()
	disableButtons = true
	quit_sound.play()

func _on_start_fire_finished():
	background_menu_music.stop()
	TransitionScreen.change_scene = true
	TransitionScreen.fade_in()

func _on_quit_sound_finished():
	get_tree().quit()


func _on_button_pressed():
	OS.shell_open("https://patreon.com/user?u=67284529")
