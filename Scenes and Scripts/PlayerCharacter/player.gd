extends CharacterBody2D

@onready var animation_player = $AnimationTree
@onready var cancel_attack = $CancelAttack

const AUDIO_TEMPLATE = preload("res://Scenes and Scripts/Singletons/audio_template.tscn")

var attacking : bool = false
var last_side = 0
var isLeft : bool = false

const SPEED = 300.0

func _physics_process(_delta):
	var direction = Input.get_axis("Left", "Right") #change
	if direction and not attacking:
		last_side = direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionUD = Input.get_axis("Up", "Down")
	if directionUD and not attacking:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	
	move_and_slide()

func _process(_delta):
	if GameData.player_HP <= 0:
		self.visible = false
		TransitionScreen.next_scene = "res://Scenes and Scripts/Menu/menu.tscn"
		TransitionScreen.change_scene = true
		TransitionScreen.fade_in()

	isLeft = last_side < 0

	animating()

	if Input.is_action_just_pressed("Attack") and not attacking:
		cancel_attack.start()
		attacking = true
		attack()

func animating():
	if velocity.x != 0 or velocity.y != 0 and not attacking:
		if isLeft:
			animation_player["parameters/Walking/blend_position"] = -1
		else:
			animation_player["parameters/Walking/blend_position"] = 1
		animation_player["parameters/conditions/isWalking"] = true
		animation_player["parameters/conditions/isIdle"] = false
	elif velocity.x == 0 and not attacking:
		if isLeft:
			animation_player["parameters/Idle/blend_position"] = -1
		else:
			animation_player["parameters/Idle/blend_position"] = 1
		animation_player["parameters/conditions/isWalking"] = false
		animation_player["parameters/conditions/isIdle"] = true

func attack():
		if isLeft:
			animation_player["parameters/Attacking/blend_position"] = -1
		else:
			animation_player["parameters/Attacking/blend_position"] = 1
		animation_player["parameters/conditions/isIdle"] = false
		animation_player["parameters/conditions/isWalking"] = false
		animation_player["parameters/conditions/isAttacking"] = true

func attack_finish():
	animation_player["parameters/conditions/isAttacking"] = false
	animation_player["parameters/conditions/isIdle"] = true
	attacking = false

func _on_damage_detection_area_entered(area):
	if area.name == "AttackArea":
		GameData.player_HP -= 1

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attacking Left" or anim_name == "Attacking Right":
		attack_finish()

func _on_cancel_attack_timeout():
	attack_finish()
