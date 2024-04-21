extends CanvasLayer

const REMAP = preload("res://Scenes and Scripts/Menu/remap.tscn")
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
@onready var background_animation = $BackgroundAnimation


func _ready():
	if !FileAccess.file_exists("user://data_save.tres"):
		load_button.disabled = true
	GameData.show_HUD = false

func _process(delta):
	start.disabled = disableButtons
	load_button.disabled = disableButtons
	quit.disabled = disableButtons
	
	if Input.is_action_just_pressed("1"):
		_on_start_pressed()
	if Input.is_action_just_pressed("2"):
		_on_load_pressed()
	if Input.is_action_just_pressed("3"):
		_on_quit_pressed()
	if Input.is_action_just_pressed("4"):
		_on_remapping_pressed()
	if Input.is_action_just_pressed("5"):
		_on_gwj_link_pressed()
	if Input.is_action_just_pressed("6"):
		_on_button_pressed() 
	
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
	GameData.save_game("user://clean_save.tres")
	print(GameData.load_game("user://clean_save.tres"))
	#
	WorldSave.loaded_coords = []
	WorldSave.data_in_chunk = []
	WorldSave.maps_info = {}
	WorldSave.maps_type = {}
	WorldSave.maps_info[Vector2(0,0)] = {}
	WorldSave.loaded_coords.append(Vector2(0,0))
	WorldSave.data_in_chunk.append(2)
	WorldSave.grass_map_info = {}
	GameData.player_HP = 10
	GameData.selected_weapon = 0
	GameData.woods = 0
	GameData.ore = 0
	GameData.plank = 0
	GameData.bar = 0
	GameData.Essence1= 0
	GameData.Essence2 = 0
	GameData.Essence3 = 0
	GameData.Essence4 = 0
	GameData.Essence5 = 0
	GameData.player_HP = 10
	GameData.weapon_hander_created = 0
	GameData.created_weapons = 1
	GameData.frame1_created = 0
	GameData.frame2_created = 0
	GameData.frame3_created = 0
	GameData.frame4_created = 0
	GameData.frame5_created = 0
	GameData.frame6_created = 0
	GameData.frame7_created = 0
	GameData.frame8_created = 0
	GameData.frame9_created = 0
	GameData.frame10_created = 0
	GameData.frame11_created = 0
	GameData.frame12_created = 0
	GameData.frame13_created = 0
	GameData.frame14_created = 0
	GameData.frame15_created = 0
	GameData.frame16_created = 0
	GameData.frame17_created = 0
	GameData.player_damage = 1
	GameData.boss_health= 10 * GameData.created_weapons
	#
	disableButtons = true
	TransitionScreen.next_scene = game_scene
	start_fire.emitting = true
	background_menu_music.stop()
	start_sound.play()

func _on_load_pressed():
	disableButtons = true
	isLoading = true
	GameData.load_game()
	background_menu_music.stop()
	load_sound.play()
	background_animation.play("starting")
	

func _on_quit_pressed():
	TransitionScreen.quitting = true
	TransitionScreen.change_scene = false
	TransitionScreen.fade_in()
	disableButtons = true
	background_menu_music.stop()
	quit_sound.play()

func _on_quit_sound_finished():
	get_tree().quit()

func _on_button_pressed():
	OS.shell_open("https://patreon.com/user?u=67284529")

func _on_remapping_pressed():
	var remap_page = REMAP.instantiate()
	add_child(remap_page)

func _on_gwj_link_pressed():
	OS.shell_open("https://itch.io/jam/godot-wild-jam-68")

func _on_start_sound_finished():
	background_menu_music.stop()
	TransitionScreen.change_scene = true
	TransitionScreen.fade_in()
