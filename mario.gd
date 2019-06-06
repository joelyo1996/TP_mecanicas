extends KinematicBody2D

var GRAVEDAD = 500
var velocidad = Vector2()
var vel_lateral = 1000
var vel_max = 2000
var vel_salto= 1500
var salto= false
var vector_normal = Vector2(0,-1)
var bala = preload("res://bala.tscn")
var flipeo = Vector2()
var flip_h =true
enum direcciones {izquierda = -1, derecha = 1}

func _ready():
	velocidad.x = 0
	velocidad.y = 0
	flipeo.y =0
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocidad.y += GRAVEDAD * delta
	
	if (Input.is_action_pressed("ui_right")):
		velocidad.x += vel_lateral
		get_node("Sprite").set_flip_h(false)
		flipeo = 10
	elif (Input.is_action_pressed("ui_left")):
		velocidad.x -= vel_lateral
		get_node("Sprite").set_flip_h(true)
		flipeo = -10
	else:
		velocidad.x = 0
	
	velocidad.x = clamp(velocidad.x, -vel_max, vel_max)
	var movimiento = velocidad * delta
	move_and_slide(movimiento,vector_normal)
	if (Input.is_action_just_pressed("ui_select")):
		disparar()
		
func _physics_process(delta):
	
	if is_on_floor():
		velocidad.y = 0
	if(Input.is_action_pressed("ui_up") and is_on_floor()):
		velocidad.y -= vel_salto
		
func disparar():
	var newbala = bala.instance()
	get_parent().add_child(newbala)
	newbala.global_position = $pos_bala.global_position
	#if (get_node("Sprite").is_flipped_h()):
		#flip_h = true
	#	newbala.direccion = newbala.izquierda
		#flipeo.x = -10
	#else:
	#	newbala.direccion = newbala.derecha
		#flipeo.x = 10
	#newbala.global_position(get_node("bala").global_position() + flipeo)			
