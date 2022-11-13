extends Control

#onready var audioStreamPlayer = $AudioStreamPlayer
const path: String = "res://Level 1/Level 1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$TransitionLayer/ColorRect.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Options_button_up():
	pass
	#show options here
	#get_tree().change_scene(path)

func _on_Story_button_up():
	
	$TransitionLayer/ColorRect.show()
	$TransitionLayer/AnimationPlayer.play("transition")
	

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(path)
