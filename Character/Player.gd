extends "res://Character/Character.gd"

export var weapon_scene_path: = "res://Object/Sword.tscn"

var player_weapon = null

func _ready() -> void:
	var weapon_instance = load(weapon_scene_path).instance()
	var weapon_anchor = $WeaponSpawnLocation/WeaponAnchorPoint
	weapon_anchor.add_child(weapon_instance)
	player_weapon = weapon_anchor.get_child(0)
	
func _physics_process(delta: float) -> void:
	move_and_slide(_speed, _FLOOR_NORMAL)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and _current_state != _STATES.ATTACK:
		_current_state = _STATES.ATTACK
		player_weapon.attack()
