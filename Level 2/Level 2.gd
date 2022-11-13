extends Node

#south east north west
var data = {
	"00": [false, true, true, false],
	"01": [false, false, true, true],
	"10": [true, true, false, false],
	"11": [true, false, false, true]
}

# Rooms
#	10 | 11
#	00 | 01

#podria eliminar el dict data y usar este chequeando si existe un valor y ya.
var associatedRoom = {
	"00": ["", "01", "10", ""],
	"01": ["", "", "11", "00"],
	"10": ["00", "11", "", ""],
	"11": ["01", "", "", "10"]
}

var currentRoom = "00"
var currentDoor = 0

var nextRoom = ""
var nextInitialDoor = -1
var selectedDoor = -1

export var isLeftAvailable = false
export var isMiddleAvailable = false
export var isRightAvailable = false

func _ready():
	print(data[currentRoom][currentDoor])
	
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
	var right = nextInitialDoor(1)
	var middle = nextInitialDoor(2)
	var left = nextInitialDoor(3)
	
	isRightAvailable = data[nextRoom][right]
	isMiddleAvailable = data[nextRoom][middle]
	isLeftAvailable = data[nextRoom][left]
	
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
