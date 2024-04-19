extends CharacterBody2D

var health : int

var current_map : Vector2
var tiles_to_move : Array
var attacking : bool = false
var canAttack : bool = false
var attack_radius : float = 10.0
@onready var attackparticle = $Attackparticle
@onready var attack_time = $AttackTime
@onready var animation_player = $AnimationPlayer
@onready var attack_shape = $AttackArea/AttackShape

const AUDIO_TEMPLATE = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")

func _ready():
	health = GameData.boss_health

func receive_info(self_map, tiles_movable):
	current_map = self_map
	tiles_to_move = tiles_movable

#When moving, change position in WorldSave using -> position / 32 (because it multiply when instantiate)
func _process(delta):
	if health <= 0:
		queue_free()
		GameData.Essence1 += 1
		WorldSave.kill_boss(current_map, 0)

	if attacking:
		attack_shape.disabled = false
		animation_player.play("Attacking")
		if attack_radius < 99:
			attack_radius += delta * 30
			attack_shape.shape.radius = attack_radius
			queue_redraw()
		else:
			attack_radius = 0.0
			attacking = false
			attack_shape.disabled = true
			attack_time.start()
			queue_redraw()

func _draw():
	if attacking:
		draw_circle($PlayerDetection.position, int(attack_radius), Color(0.698039, 0.133333, 0.133333, 0.5))
		draw_circle($PlayerDetection.position, 100, Color(0.698039, 0.133333, 0.133333, 0.1))

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		attacking = true
		canAttack = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		canAttack = false

func _on_attack_time_timeout():
	if canAttack:
		attacking = true

func _on_damage_area_area_entered(area):
	if area.name == "PlayerAttackArea":
		health -= 1
