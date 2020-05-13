extends KinematicBody2D

const _FLOOR_NORMAL: = Vector2.UP
enum _STATES {IDLE, MOVE, ATTACK}

export var _speed: = Vector2(0.0, 1000.0)

var _current_state = _STATES.IDLE
