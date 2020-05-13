extends Area2D

export var _travel_speed: = Vector2(1500 , 0)

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	var speed: = Vector2(-1.0, 0.0) * _travel_speed
	position = position + speed * delta

func _on_screen_exited():
	queue_free()

func _on_Projectile_area_entered(area):
	queue_free()

func _on_Projectile_body_entered(body):
	body.queue_free()
