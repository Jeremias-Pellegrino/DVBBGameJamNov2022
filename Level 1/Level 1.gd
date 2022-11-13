extends Control

onready var scene = $Scene
var path: String = "res://Level 2/Level 2.tscn"
var walls = [load("res://Level 1/1.png"), load("res://Level 1/2.png"), load("res://Level 1/4.png"), load("res://Level 1/3.png")]
var currentIndex = 0

var h = 0
var s = 0 
var m = 0

var timer = Timer.new()

func do_this():
	path = "res://You lose.tscn"
	$TransitionLayer/ColorRect.show()
	$TransitionLayer/AnimationPlayer.play("transition")

#comida, manise, llave
var conditions = [false, false, false]

# Called when the node enters the scene tree for the first time.
func _ready():
	$TransitionLayer/ColorRect.hide()
	$FootStepsPlayer.autoplay = false
	$Background.texture = walls[0]
	$Comida.hide()
	$Manise.hide()
	
	timer.connect("timeout",self,"do_this")
	timer.wait_time = 180
	timer.one_shot = true
	add_child(timer)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if s > 59:
		m += 1
		h = 0

	if m > 59:
		h += 1
		m = 0
	
	var timerText = str(2 - m)+":"+str(60-s)
	$TimerLabel.bbcode_text = timerText
	
	var tmp = conditions.duplicate()
	for condition in conditions:
		if condition == true:
			tmp.pop_front()

	if tmp.empty() && currentIndex == 3:
		$TransitionLayer/ColorRect.show()
		$TransitionLayer/AnimationPlayer.play("transition")
		
	if currentIndex == 2 && !conditions[0]:
		$Comida.show()
	else:
		$Comida.hide()
		
	if currentIndex == 2 && !conditions[1]:
		$Manise.show()
	else:
		$Manise.hide()
		
	if currentIndex == 1 && !conditions[2]:
		$Llave.show()
	else:
		$Llave.hide()

	#if currentIndex == 3 && conditions[1]:
	#	pass
		
func _on_LeftArrow_button_up():
	currentIndex -= 1
	if currentIndex < 0:
		currentIndex = 3

	print("left arrow, currentIndex: ", currentIndex)
	$Background.texture = walls[currentIndex]
	$FootStepsPlayer.position = Vector2(0,200)
	$FootStepsPlayer.play()
	
func _on_RightArrow_button_up():
	
	currentIndex += 1
	if currentIndex > 3:
		currentIndex = 0
		
	if currentIndex == 3:
		conditions[1] = true
	print("right arrow, currentIndex: ", currentIndex)
	$Background.texture = walls[currentIndex]
	$FootStepsPlayer.position = Vector2(1000,200)
	$FootStepsPlayer.play()
	
func _on_Timer_timeout():
	s += 0.1

func _on_FootStepsPlayer_finished():
	$FootStepsPlayer.stop()

func _on_AcceptDialog_confirmed():
	#iluminar puerta
	pass

func _on_Comida_button_up():
	conditions[0] = true
	$AcceptDialog.show()

func _on_Manise_button_up():
	conditions[1] = true

func _on_Llave_button_up():
	conditions[2] = true

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(path)
