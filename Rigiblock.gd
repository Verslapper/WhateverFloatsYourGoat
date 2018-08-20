extends RigidBody2D

signal funk

export (String) var letter

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
	#var x = get_colliding_bodies()
	#print(x)

func _on_Rigiblock_body_entered(body):
	if (body.get_name() != "TileMap"):
		print("Collision with " + body.get_name())