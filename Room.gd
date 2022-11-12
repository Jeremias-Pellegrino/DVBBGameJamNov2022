extends Resource

export(int) var health
export(Resource) var doors
export(Array, String) var strings

func _init(p_health = 0, p_doors = null, p_strings = []):
	health = p_health
	doors = p_doors
	strings = p_strings


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
