extends CharacterBody2D


var velocidade = 200
var Rato = null
func _ready() -> void:
	Rato=get_tree().current_scene.get_node("Rato")

#sinal de conexão com o rato
