extends Area2D

signal attack_finished

onready var animation_player = $AnimationPlayer

func _on_animation_finished(anim_name):
	animation_player.play(("IDLE"))
	emit_signal("attack_finished")

func attack() ->void:
	animation_player.play("attack")


func _on_Sword_body_entered(body):
	body.queue_free()
