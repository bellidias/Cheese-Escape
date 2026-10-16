extends Node2D
func _process(delta: float) -> void:
	$AnimatedSprite2D.play()


func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_reiniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")
