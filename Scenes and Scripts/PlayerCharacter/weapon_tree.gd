extends Node2D

#INPUT MAP
@onready var label_1 = $"CanvasLayer/GridContainer/1/Label1"
@onready var label_2 = $"CanvasLayer/GridContainer/2/Label2"
@onready var label_3 = $"CanvasLayer/GridContainer/3/Label3"
@onready var label_4 = $"CanvasLayer/GridContainer/4/Label4"
@onready var label_5 = $"CanvasLayer/GridContainer/5/Label5"
@onready var label_6 = $"CanvasLayer/GridContainer/6/Label6"
@onready var label_7 = $"CanvasLayer/GridContainer/7/Label7"
@onready var label_8 = $"CanvasLayer/GridContainer/8/Label8"
@onready var label_9 = $"CanvasLayer/GridContainer/9/Label9"
@onready var esc = $CanvasLayer/Button/ESC
@onready var craft = $CanvasLayer/Next/Craft
@onready var process = $CanvasLayer/Previous/Process

@onready var weapon_1 = $"CanvasLayer/GridContainer/1/Weapon1"
@onready var weapon_2 = $"CanvasLayer/GridContainer/2/Weapon2"
@onready var weapon_3 = $"CanvasLayer/GridContainer/3/Weapon3"
@onready var weapon_4 = $"CanvasLayer/GridContainer/4/Weapon4"
@onready var weapon_5 = $"CanvasLayer/GridContainer/5/Weapon5"
@onready var weapon_6 = $"CanvasLayer/GridContainer/6/Weapon6"
@onready var weapon_7 = $"CanvasLayer/GridContainer/7/Weapon7"
@onready var weapon_8 = $"CanvasLayer/GridContainer/8/Weapon8"
@onready var weapon_9 = $"CanvasLayer/GridContainer/9/Weapon9"

@onready var quant_1 = $"CanvasLayer/GridContainer/1/Weapon1/Quant1"
@onready var quant_2 = $"CanvasLayer/GridContainer/2/Weapon2/Quant2"
@onready var quant_3 = $"CanvasLayer/GridContainer/3/Weapon3/Quant3"
@onready var quant_4 = $"CanvasLayer/GridContainer/4/Weapon4/Quant4"
@onready var quant_5 = $"CanvasLayer/GridContainer/5/Weapon5/Quant5"
@onready var quant_6 = $"CanvasLayer/GridContainer/6/Weapon6/Quant6"
@onready var quant_7 = $"CanvasLayer/GridContainer/7/Weapon7/Quant7"
@onready var quant_8 = $"CanvasLayer/GridContainer/8/Weapon8/Quant8"
@onready var quant_9 = $"CanvasLayer/GridContainer/9/Weapon9/Quant9"


func _ready():
	label_1.text = str(InputMap.action_get_events("1")[0].as_text())
	label_2.text = str(InputMap.action_get_events("2")[0].as_text())
	label_3.text = str(InputMap.action_get_events("3")[0].as_text())
	label_4.text = str(InputMap.action_get_events("4")[0].as_text())
	label_5.text = str(InputMap.action_get_events("5")[0].as_text())
	label_6.text = str(InputMap.action_get_events("6")[0].as_text())
	label_7.text = str(InputMap.action_get_events("7")[0].as_text())
	label_8.text = str(InputMap.action_get_events("8")[0].as_text())
	label_9.text = str(InputMap.action_get_events("9")[0].as_text())
	esc.text = str(InputMap.action_get_events("Menu")[0].as_text())
	process.text = str(InputMap.action_get_events("Process")[0].as_text())
	craft.text = str(InputMap.action_get_events("Craft")[0].as_text())
	#check input map and show here
	
	quant_1.text = "1"
	quant_2.text = str(GameData.frame1_created)
	quant_3.text = str(GameData.frame2_created)
	quant_4.text = str(GameData.frame3_created)
	quant_5.text = str(GameData.frame4_created)
	quant_6.text = str(GameData.frame5_created)
	quant_7.text = str(GameData.frame6_created)
	quant_8.text = str(GameData.frame7_created)
	quant_9.text = str(GameData.frame8_created)
	
	if GameData.frame1_created > 0:
		$"CanvasLayer/GridContainer/2".disabled = false
	else:
		$"CanvasLayer/GridContainer/2".disabled = true
	
	if GameData.frame2_created > 0:
		$"CanvasLayer/GridContainer/3".disabled = false
	else:
		$"CanvasLayer/GridContainer/3".disabled = true
	
	if GameData.frame3_created > 0:
		$"CanvasLayer/GridContainer/4".disabled = false
	else:
		$"CanvasLayer/GridContainer/4".disabled = true
	
	if GameData.frame4_created > 0:
		$"CanvasLayer/GridContainer/5".disabled = false
	else:
		$"CanvasLayer/GridContainer/5".disabled = true
	
	if GameData.frame5_created > 0:
		$"CanvasLayer/GridContainer/6".disabled = false
	else:
		$"CanvasLayer/GridContainer/6".disabled = true
	
	if GameData.frame6_created > 0:
		$"CanvasLayer/GridContainer/7".disabled = false
	else:
		$"CanvasLayer/GridContainer/7".disabled = true
	
	if GameData.frame7_created > 0:
		$"CanvasLayer/GridContainer/8".disabled = false
	else:
		$"CanvasLayer/GridContainer/8".disabled = true
	
	if GameData.frame8_created > 0:
		$"CanvasLayer/GridContainer/9".disabled = false
	else:
		$"CanvasLayer/GridContainer/9".disabled = true

func _process(delta):
	if Input.is_action_just_pressed("1"):
		match weapon_1.frame:
			0:
				_on_1_pressed()
			9:
				if GameData.frame9_created > 0:
					_on_1_pressed()

	if Input.is_action_just_pressed("2"):
		match weapon_2.frame:
			1:
				if GameData.frame1_created > 0:
					_on_2_pressed()
			10:
				if GameData.frame10_created > 0:
					_on_2_pressed()

	if Input.is_action_just_pressed("3"):
		match weapon_3.frame:
			2:
				if GameData.frame2_created > 0:
					_on_3_pressed()
			11:
				if GameData.frame11_created > 0:
					_on_3_pressed()

	if Input.is_action_just_pressed("4"):
		match weapon_4.frame:
			3:
				if GameData.frame3_created > 0:
					_on_4_pressed()
			12:
				if GameData.frame12_created > 0:
					_on_4_pressed()

	if Input.is_action_just_pressed("5"):
		match weapon_5.frame:
			4:
				if GameData.frame4_created > 0:
					_on_5_pressed()
			13:
				if GameData.frame13_created > 0:
					_on_5_pressed()

	if Input.is_action_just_pressed("6"):
		match weapon_6.frame:
			5:
				if GameData.frame5_created > 0:
					_on_6_pressed()
			14:
				if GameData.frame14_created > 0:
					_on_6_pressed()

	if Input.is_action_just_pressed("7"):
		match weapon_7.frame:
			6:
				if GameData.frame6_created > 0:
					_on_7_pressed()
			15:
				if GameData.frame15_created > 0:
					_on_7_pressed()

	if Input.is_action_just_pressed("8"):
		match weapon_8.frame:
			7:
				if GameData.frame7_created > 0:
					_on_8_pressed()
			16:
				if GameData.frame16_created > 0:
					_on_8_pressed()

	if Input.is_action_just_pressed("9"):
		match weapon_9.frame:
			8:
				if GameData.frame8_created > 0:
					_on_9_pressed()
			17:
				if GameData.frame17_created > 0:
					_on_9_pressed()
	
	if Input.is_action_just_pressed("Menu"):
		_on_button_pressed()
	
	if Input.is_action_just_pressed("Craft"):
		_on_next_pressed()
	
	if Input.is_action_just_pressed("Process"):
		_on_previous_pressed()

func _on_button_pressed():
	get_tree().paused = false
	queue_free()

func _on_next_pressed():
	weapon_1.frame = 9
	weapon_2.frame = 10
	weapon_3.frame = 11
	weapon_4.frame = 12
	weapon_5.frame = 13
	weapon_6.frame = 14
	weapon_7.frame = 15
	weapon_8.frame = 16
	weapon_9.frame = 17
	quant_1.text = str(GameData.frame9_created)
	quant_2.text = str(GameData.frame10_created)
	quant_3.text = str(GameData.frame11_created)
	quant_4.text = str(GameData.frame12_created)
	quant_5.text = str(GameData.frame13_created)
	quant_6.text = str(GameData.frame14_created)
	quant_7.text = str(GameData.frame15_created)
	quant_8.text = str(GameData.frame16_created)
	quant_9.text = str(GameData.frame17_created)
	if GameData.frame9_created > 0:
		$"CanvasLayer/GridContainer/1".disabled = false
	else:
		$"CanvasLayer/GridContainer/1".disabled = true
		
	if GameData.frame10_created > 0:
		$"CanvasLayer/GridContainer/2".disabled = false
	else:
		$"CanvasLayer/GridContainer/2".disabled = true
	
	if GameData.frame11_created > 0:
		$"CanvasLayer/GridContainer/3".disabled = false
	else:
		$"CanvasLayer/GridContainer/3".disabled = true
	
	if GameData.frame12_created > 0:
		$"CanvasLayer/GridContainer/4".disabled = false
	else:
		$"CanvasLayer/GridContainer/4".disabled = true
	
	if GameData.frame13_created > 0:
		$"CanvasLayer/GridContainer/5".disabled = false
	else:
		$"CanvasLayer/GridContainer/5".disabled = true
	
	if GameData.frame14_created > 0:
		$"CanvasLayer/GridContainer/6".disabled = false
	else:
		$"CanvasLayer/GridContainer/6".disabled = true
	
	if GameData.frame15_created > 0:
		$"CanvasLayer/GridContainer/7".disabled = false
	else:
		$"CanvasLayer/GridContainer/7".disabled = true
	
	if GameData.frame16_created > 0:
		$"CanvasLayer/GridContainer/8".disabled = false
	else:
		$"CanvasLayer/GridContainer/8".disabled = true
	
	if GameData.frame17_created > 0:
		$"CanvasLayer/GridContainer/9".disabled = false
	else:
		$"CanvasLayer/GridContainer/9".disabled = true
	
func _on_previous_pressed():
	weapon_1.frame = 0
	weapon_2.frame = 1
	weapon_3.frame = 2
	weapon_4.frame = 3
	weapon_5.frame = 4
	weapon_6.frame = 5
	weapon_7.frame = 6
	weapon_8.frame = 7
	weapon_9.frame = 8
	quant_1.text = "1"
	quant_2.text = str(GameData.frame1_created)
	quant_3.text = str(GameData.frame2_created)
	quant_4.text = str(GameData.frame3_created)
	quant_5.text = str(GameData.frame4_created)
	quant_6.text = str(GameData.frame5_created)
	quant_7.text = str(GameData.frame6_created)
	quant_8.text = str(GameData.frame7_created)
	quant_9.text = str(GameData.frame8_created)

	$"CanvasLayer/GridContainer/1".disabled = false

	if GameData.frame1_created > 0:
		$"CanvasLayer/GridContainer/2".disabled = false
	else:
		$"CanvasLayer/GridContainer/2".disabled = true

	if GameData.frame2_created > 0:
		$"CanvasLayer/GridContainer/3".disabled = false
	else:
		$"CanvasLayer/GridContainer/3".disabled = true

	if GameData.frame3_created > 0:
		$"CanvasLayer/GridContainer/4".disabled = false
	else:
		$"CanvasLayer/GridContainer/4".disabled = true

	if GameData.frame4_created > 0:
		$"CanvasLayer/GridContainer/5".disabled = false
	else:
		$"CanvasLayer/GridContainer/5".disabled = true

	if GameData.frame5_created > 0:
		$"CanvasLayer/GridContainer/6".disabled = false
	else:
		$"CanvasLayer/GridContainer/6".disabled = true

	if GameData.frame6_created > 0:
		$"CanvasLayer/GridContainer/7".disabled = false
	else:
		$"CanvasLayer/GridContainer/7".disabled = true

	if GameData.frame7_created > 0:
		$"CanvasLayer/GridContainer/8".disabled = false
	else:
		$"CanvasLayer/GridContainer/8".disabled = true

	if GameData.frame8_created > 0:
		$"CanvasLayer/GridContainer/9".disabled = false
	else:
		$"CanvasLayer/GridContainer/9".disabled = true

func _on_1_pressed():
	GameData.selected_weapon = weapon_1.frame
	if weapon_1.frame == 0:
		GameData.change_player_damage(1)
	elif weapon_1.frame == 9:
		GameData.change_player_damage(3)
	get_tree().paused = false
	queue_free()

func _on_2_pressed():
	GameData.selected_weapon = weapon_2.frame
	if weapon_2.frame == 1:
		GameData.change_player_damage(3)
	elif weapon_2.frame == 10:
		GameData.change_player_damage(4)
	get_tree().paused = false
	queue_free()
	get_tree().paused = false
	queue_free()

func _on_3_pressed():
	GameData.selected_weapon = weapon_3.frame
	if weapon_1.frame == 2:
		GameData.change_player_damage(4)
	elif weapon_1.frame == 11:
		GameData.change_player_damage(4)
	get_tree().paused = false
	queue_free()

func _on_4_pressed():
	GameData.selected_weapon = weapon_4.frame
	if weapon_4.frame == 3:
		GameData.change_player_damage(4)
	elif weapon_4.frame == 12:
		GameData.change_player_damage(5)
	get_tree().paused = false
	queue_free()

func _on_5_pressed():
	GameData.selected_weapon = weapon_5.frame
	if weapon_5.frame == 4:
		GameData.change_player_damage(5)
	elif weapon_5.frame == 13:
		GameData.change_player_damage(20)
	get_tree().paused = false
	queue_free()

func _on_6_pressed():
	GameData.selected_weapon = weapon_6.frame
	if weapon_6.frame == 5:
		GameData.change_player_damage(3)
	elif weapon_6.frame == 14:
		GameData.change_player_damage(25)
	get_tree().paused = false
	queue_free()

func _on_7_pressed():
	GameData.selected_weapon = weapon_7.frame
	if weapon_7.frame == 6:
		GameData.change_player_damage(4)
	elif weapon_7.frame == 15:
		GameData.change_player_damage(35)
	get_tree().paused = false
	queue_free()

func _on_8_pressed():
	GameData.selected_weapon = weapon_8.frame
	if weapon_8.frame == 7:
		GameData.change_player_damage(4)
	elif weapon_8.frame == 16:
		GameData.change_player_damage(35)
	get_tree().paused = false
	queue_free()

func _on_9_pressed():
	GameData.selected_weapon = weapon_9.frame
	if weapon_9.frame == 8:
		GameData.change_player_damage(5)
	elif weapon_9.frame == 17:
		GameData.change_player_damage(50)
	get_tree().paused = false
	queue_free()
