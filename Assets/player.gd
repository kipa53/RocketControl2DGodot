extends RigidBody3D

## how much vertical force to apply when moving.
@export var Thrust: float = 1000.0
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * Thrust)	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0,100.0 * delta))
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0,-100.0 * delta))
		
	




func _on_body_entered(body: Node) -> void:
	if "goal" in body.get_groups():
		print("win")
	if "floor" in body.get_groups():
		print("you lose")
