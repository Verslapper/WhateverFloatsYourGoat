extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var parentLetter = get_parent().letter
	set_text(parentLetter)