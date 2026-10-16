extends CharacterBody2D

@export var velocidade: float = 90.0
var rato: Node2D

func _ready():
	# Pega o Rato que tá na cena Jogo
	# Como o Gato vai ser filho do Jogo, o Rato é irmão dele
	rato = get_parent().get_node_or_null("Rato")
	
	# Se não achou de primeira (porque a cena ainda tá carregando), tenta de outro jeito
	if rato == null:
		await get_tree().process_frame
		rato = get_tree().current_scene.get_node_or_null("Rato")

func _physics_process(_delta):
	if rato == null:
		return
	
	var direcao = (rato.global_position - global_position).normalized()
	velocity = direcao * velocidade
	move_and_slide()
