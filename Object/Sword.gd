extends Area2D

onready var animation_player = $AnimationPlayer

func attack() ->void:
	animation_player.play("attack")
