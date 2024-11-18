extends Sprite2D

var can_fire = true
var bullet = preload("res://Scenes/ObjectReutilisable/Bullet.tscn")
@onready var gun: Sprite2D = $"."
var rotation_speed = 10  

func _ready():
	set_as_top_level(true)

func _process(delta):
	var aim_dir = Vector2(
		Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left"),
		Input.get_action_strength("aim_down") - Input.get_action_strength("aim_up")
	)
	
	var target_rotation = 0.0

	if aim_dir.length() > 0:
		target_rotation = aim_dir.angle()
	else:
		var mouse_pos = get_global_mouse_position()
		target_rotation = (mouse_pos - global_position).angle() 

	gun.rotation = lerp_angle(gun.rotation, target_rotation, rotation_speed * delta)

func _physics_process(delta):
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = gun.rotation 
		bullet_instance.global_position = $Marker2D.global_position
		get_parent().add_child(bullet_instance)
		can_fire = false
		await get_tree().create_timer(0.2).timeout
		can_fire = true
