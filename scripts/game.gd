extends Node2D

onready var felpudo = get_node("Felpudo")
onready var animacao = get_node("BackAnim")
onready var timerreplay = get_node("TimerToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass
	
func kill():
	print("You died!")
	felpudo.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	animacao.stop()
	estado = PERDENDO
	timerreplay.start()
	get_node("Hit/Timer_Hit").start(true)
	get_node("Hit").play()
	
func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("Score/Timer_Score").start(true)
	get_node("Score").play()

func _on_TimerToReplay_timeout():
	get_tree().reload_current_scene()
	estado = JOGANDO
	


func _on_Timer_Score_timeout():
	get_node("Score").stop()


func _on_Timer_Hit_timeout():
	get_node("Hit").stop()
