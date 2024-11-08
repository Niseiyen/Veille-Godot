extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_droite: RayCast2D = $RayCastDroite
@onready var ray_cast_gauche: RayCast2D = $RayCastGauche

func _process(delta):
	if ray_cast_droite.is_colliding():
		direction = -1
	if ray_cast_gauche.is_colliding():
		direction = 1
	
	position.x += direction * SPEED * delta
