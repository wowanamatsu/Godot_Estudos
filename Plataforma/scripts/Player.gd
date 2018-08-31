extends KinematicBody2D

# Constante que define a posição do chão na cena
const CHAO = Vector2(0, -1)
const GRAVIY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()
var life = 3

func _physics_process(delta):
	
	# Adicionando gravidade ao personagem
	motion.y += GRAVIY
	
	# Movimentação do personagem
	if Input.is_action_pressed("Right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("Left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else: 
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor(): # Verifica se o personagem esta tocando o chão
		if Input.is_action_pressed("UP"):
			motion.y = JUMP_HEIGHT
	else: $Sprite.play("Jump")
		
	motion = move_and_slide(motion, CHAO)
	


# Ao tocar um monstro a função dano do monstro é ativada.
func _on_pes_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT
	

# Toda vez que o player é tocado por um monstro perde vida.
func _on_dano_body_entered(body):
	life -= 1
	if life == 0: 
		$".".queue_free()
		get_tree().change_scene("Menu.tscn")
	
	
	
	
