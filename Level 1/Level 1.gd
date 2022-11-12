extends Control

onready var scene = $Scene
const path: String = "res://Level 2/Level 2.tscn"

#ponele que sean 2 o 3, puede ser cualquiwer numero
#las condiciones deben ser linkeadas a este script

var conditions = [true, true]

# Called when the node enters the scene tree for the first time.
func _ready():
	#load condtions
	print("load lvl1")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tmp = conditions.duplicate()
	for condition in conditions:
		if condition == true:
			tmp.pop_front()
	
	if tmp.empty():
		pass
		get_tree().change_scene(path)
