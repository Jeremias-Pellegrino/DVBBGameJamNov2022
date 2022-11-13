extends Resource

const MyRoom = preload("Room.gd")

#Sur, Este, Norte, Oeste (contrareloj)
var data = {
	"00": [false, true, true, false],
	"01": [false, false, true, true],
	"10": [true, true, false, false],
	"11": [true, false, false, true]
}

func _init():
	print(data)
