extends Control

#onready var audioStreamPlayer = $AudioStreamPlayer
const path: String = "res://Level 1/Level1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Options_button_up():
	#show options here
	#get_tree().change_scene(path)
	pass

func _on_Story_button_up():
	print("story")
	get_tree().change_scene(path)
