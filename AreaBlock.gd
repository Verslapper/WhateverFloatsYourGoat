extends Area2D

signal hit

export (String) var letter

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_AreaBlock_body_entered(body):
	if (body.name == "Player"):
		emit_signal("hit", letter)
		$CollisionShape2D.disabled = true
		$Label.set_text("-")
