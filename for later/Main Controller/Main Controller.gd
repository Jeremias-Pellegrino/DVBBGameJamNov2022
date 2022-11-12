extends Control

const path: String = "res://Level 1/Level 1.tscn"
const level1 = preload("res://Level 1/Level 1.tscn")
const level2 = preload("res://Level 2/Level 2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene(path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
