extends Node

# Rooms
#	10 | 11
#	00 | 01

#podria eliminar el dict data y usar este chequeando si existe un valor y ya.
var associatedRoom = {
	#south east north west
	"00": ["", "01", "10", ""],
	"01": ["", "02", "11", "00"],
	"02": ["", "", "12", "01"],
	"10": ["00", "11", "", ""],
	"11": ["01", "12", "", "10"],
	"12": ["02", "", "22", "11"],
	"20": ["10", "21", "", ""],
	"21": ["11", "22", "", "20"],
	"22": ["12", "", "", "21"]
}

var currentRoom = "01"
var currentDoor = 0

var nextRoom = ""
var nextInitialDoor = -1
var selectedDoor = -1

export var isLeftAvailable = false
export var isMiddleAvailable = false
export var isRightAvailable = false

func _ready():
	#print(data[currentRoom][currentDoor])
	pass
	
func nextInitialDoor(forDoor: int):
	
	#la proxima posicion inicial siempre va ser opuesta la final current
	nextInitialDoor = selectedDoor + 2
	if nextInitialDoor > 3:
		nextInitialDoor -= 4
	
	#el indice relativo en funcion de la proxima posicion inicial
	var index = forDoor + nextInitialDoor
	if index > 3:
		index = index - 4
	return index
	
func loadNext():	
	
	print("currentRoom: ", currentRoom)
	print("currentDoor: ", currentDoor)
	
	var right = nextInitialDoor(1)
	var middle = nextInitialDoor(2)
	var left = nextInitialDoor(3)
	
	#TODO: make it safe for "" cases.
	isRightAvailable = associatedRoom[nextRoom][right] != ""
	isMiddleAvailable = associatedRoom[nextRoom][middle] != ""
	isLeftAvailable = associatedRoom[nextRoom][left] != ""
	
	if !isLeftAvailable:
		$LeftDoorButton.hide()
	else:
		$LeftDoorButton.show()
		
	if !isMiddleAvailable:
		$MiddleDoorButton.hide()
	else:
		$MiddleDoorButton.show()
		
	if !isRightAvailable:
		$RightDoorButton.hide()
	else:
		$RightDoorButton.show()
	
	currentRoom = nextRoom
	currentDoor = nextInitialDoor
	
	if currentRoom == "11":
		$Sprite.show()
	else:
		$Sprite.hide()
	
	if currentRoom == "20" && currentDoor == 1:
		$TransitionLayer/AnimationPlayer.play("transition")

func setupNextRoom():
	nextRoom = associatedRoom[currentRoom][selectedDoor]
	loadNext()

# current -1
func _on_LeftDoorButton_button_up():
	if currentDoor == 0:
		selectedDoor = 3
	if currentDoor == 3:
		selectedDoor = 2
	if currentDoor == 2:
		selectedDoor = 1
	if currentDoor == 1:
		selectedDoor = 0
	
	setupNextRoom()

#current +1
func _on_RightDoorButton_button_up():
	if currentDoor == 0:
		selectedDoor = 1
	if currentDoor == 1:
		selectedDoor = 2
	if currentDoor == 2:
		selectedDoor = 3
	if currentDoor == 3:
		selectedDoor = 0

	setupNextRoom()

#current +2
func _on_MiddleDoorButton_button_up():
	if currentDoor == 0:
		selectedDoor = 2
	if currentDoor == 2:
		selectedDoor = 0
	if currentDoor == 2:
		selectedDoor = 4
	if currentDoor == 4:
		selectedDoor = 2

	setupNextRoom()

func _on_AnimationPlayer_animation_finished(anim_name):
	$TransitionLayer/ColorRect.hide()
	$FinalImage.show()
