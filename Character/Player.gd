extends "res://Character/Character.gd"

export var weapon_scene_path: = "res://Object/Sword.tscn"
export var player_horizontal_speed: = 500.0

var player_weapon = null

func _ready() -> void:
	var weapon_instance = load(weapon_scene_path).instance()
	var weapon_anchor = $WeaponSpawnLocation/WeaponAnchorPoint
	weapon_anchor.add_child(weapon_instance)
	player_weapon = weapon_anchor.get_child(0)
	player_weapon.connect("attack_finished", self, "on_player_weapon_attack_finished")
	
func _physics_process(delta: float) -> void:
	var direction: = get_move_direction()
	facing_direction(direction.x)
	_speed.x = player_horizontal_speed * direction.x
	move_and_slide(_speed, _FLOOR_NORMAL)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and _current_state != _STATES.ATTACK:
		_current_state = _STATES.ATTACK
		player_weapon.attack()
		
func on_player_weapon_attack_finished() -> void:
	_current_state = _STATES.IDLE
	
func get_move_direction() ->Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		0.0 
	)
func facing_direction(direction: float) -> void:
	if direction > 0.0:
		$WeaponSpawnLocation.scale.x = 1.0
	elif direction < 0.0:
		$WeaponSpawnLocation.scale.x = -1.0
