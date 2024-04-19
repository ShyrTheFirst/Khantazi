extends CanvasLayer

@onready var wood_quant = $Panel/HBoxContainer/Wood/WoodQuant
@onready var ore_quant = $Panel/HBoxContainer/Ore/OreQuant
@onready var plank_quant = $Panel/HBoxContainer/Plank/PlankQuant
@onready var bar_quant = $Panel/HBoxContainer/Bar/BarQuant
@onready var essence_1_quant = $"Panel/HBoxContainer/Essence 1/Essence1Quant"
@onready var essence_2_quant = $"Panel/HBoxContainer/Essence 2/Essence2Quant"
@onready var essence_3_quant = $"Panel/HBoxContainer/Essence 3/Essence3Quant"
@onready var essence_4_quant = $"Panel/HBoxContainer/Essence 4/Essence4Quant"
@onready var essence_5_quant = $"Panel/HBoxContainer/Essence 5/Essence5Quant"

@onready var player_hp = $PlayerHP

func _ready():
	self.visible = GameData.show_HUD

func _process(_delta):
	self.visible = GameData.show_HUD
	player_hp.size.x = (100*GameData.player_HP)/10
	wood_quant.text = str(GameData.woods)
	ore_quant.text = str(GameData.ore)
	plank_quant.text = str(GameData.plank)
	bar_quant.text = str(GameData.bar)
	essence_1_quant.text = str(GameData.Essence1)
	essence_2_quant.text = str(GameData.Essence2)
	essence_3_quant.text = str(GameData.Essence3)
	essence_4_quant.text = str(GameData.Essence4)
	essence_5_quant.text = str(GameData.Essence5)


func _on_button_pressed():
	TransitionScreen.next_scene = "res://Scenes and Scripts/Menu/menu.tscn"
	TransitionScreen.change_scene = true
	TransitionScreen.fade_in()
