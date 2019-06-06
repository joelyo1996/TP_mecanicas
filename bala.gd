extends KinematicBody2D

var direccion = 1
var velocidad = 500
var vel_lateral = 1000
var vel_max = 2000
enum direcciones {izquierda = -1, derecha = 1}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var move = move_and_collide(Vector2(direccion*velocidad*delta,direccion*velocidad*delta))
	
func _set_direccion(value):
	direccion = Vector2(value,0)
