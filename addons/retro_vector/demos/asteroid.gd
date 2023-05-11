extends RigidBody3D

func _ready() -> void:
	randomize()
	$CollisionShape3D.global_scale(Vector3.ONE * randf_range(0.5,2))
	var dir : Vector3 = Vector3(randf(),randf(),randf())
	linear_velocity = dir * randf_range(-50,50)
	angular_velocity = dir * randf_range(-2,2)
