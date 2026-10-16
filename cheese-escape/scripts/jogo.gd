extends Node2D

@export var vidas: int = 3
@onready var rato = $Rato
@onready var gato = $Gato

func _ready():
	atualizar_ui()
	# Pega a posição inicial pra resetar se precisar
	print("Cheese-Escape iniciado! Vidas: ", vidas)

func atualizar_ui():
	# Se você tiver um Label na UI, arraste aqui. Por enquanto mostra no console
	# $CanvasLayer/Label.text = "Vidas: %s" % vidas
	pass

func perder_vida():
	vidas -= 1
	atualizar_ui()
	print("Ai! Ratoeira! Vidas restantes: ", vidas)
	if vidas <= 0:
		derrota("Perdeu todas as vidas nas ratoeiras!")

func ganhar_vida():
	vidas += 1
	if vidas > 5: vidas = 5
	atualizar_ui()
	print("Migalha coletada! Vidas: ", vidas)

func vitoria():
	print("VITÓRIA! Comeu o queijo!")
	get_tree().change_scene_to_file("res://cenas/vitoria.tscn")

func derrota(motivo: String):
	print("DERROTA: ", motivo)
	get_tree().change_scene_to_file("res://cenas/derrota.tscn")

# Essa função vai ser chamada pela Ratoeira pra aumentar dificuldade
func _on_timer_spawn_timeout():
	var nova = preload("res://cenas/ratoeira.tscn").instantiate()
	# Pega uma posição aleatória no labirinto
	nova.global_position = Vector2(randf_range(100, 600), randf_range(100, 500))
	add_child(nova)
