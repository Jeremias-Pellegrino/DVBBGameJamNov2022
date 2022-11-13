extends Resource

#export(int) var health
#export(Resource) var doors
export(Array, bool) var doors

func _init(p_doors = []):
	doors = p_doors

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
