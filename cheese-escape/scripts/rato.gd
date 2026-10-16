extends CharacterBody2D

@export var velocidade: float = 150.0

func _physics_process(_delta):
	# movimento com as setas
	var dir_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var dir_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = Vector2(dir_x, dir_y).normalized() * velocidade
	move_and_slide()
