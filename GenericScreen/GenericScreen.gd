tool
extends Control

export(String) var backgroundTexture
export(String) var backgroundTexture2
export(String) var backgroundTexture3
export(String) var backgroundTexture4

onready var textureRect : TextureRect = $TextureRect
onready var leftButton : TextureButton = $LeftArrow
onready var rightButton : TextureButton = $RightArrow

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_LeftArrow_button_up():
	pass # Replace with function body.


func _on_RightArrow_button_up():
	pass # Replace with function body.
