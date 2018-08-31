extends Area2D

# Pega todas as cenas do jogo

export(String, FILE, "*.tscn") var cenas


func _on_Passagem_body_entered(body):
	
	# Mudando de cena (fase/level)
	get_tree().change_scene(cenas)

