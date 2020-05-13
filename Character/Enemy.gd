extends "res://Character/Character.gd"

onready var _shooting_timer: = $ShootingTimer

export var _shooting_interval: = 1.0
export var _projectile_path: = "res://Object/Projectile.tscn"

func _ready() -> void:
	_shooting_timer.start(_shooting_interval)

func _physics_process(delta: float) -> void:
	move_and_slide(_speed, _FLOOR_NORMAL)

func _on_ShootingTimer_timeout():
	var projectile = load(_projectile_path).instance()
	get_parent().add_child(projectile)
	projectile.set_global_position($ProjectileSpawnLocation.get_global_position())
