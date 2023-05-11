extends RigidBody3D

#mouse controls
#mouse X: yaw
#mouse Y: pitch
#left,right: roll
#up,down: throttle

var throttle_input: float = 0.0
var throttle: float = 0.0
@export var throttle_rate: float = 0.5

var pitch_input: float = 0.0
var yaw_input: float = 0.0
var roll_input: float = 0.0
var strafe_input: float = 0.0


@export var force_scalar: float = 1000.0
var linear_force := Vector3.ONE * 100
var angular_force := Vector3.ONE * 4

var applied_linear_force := Vector3.ZERO
var applied_angular_force := Vector3.ZERO

@export var show_mouse: bool = true;

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED if show_mouse else Input.MOUSE_MODE_CONFINED_HIDDEN


func _process(delta: float) -> void:
	get_input(delta)

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _physics_process(delta: float) -> void:
	apply_central_force(applied_linear_force )
	apply_torque(global_transform.basis * applied_angular_force)


func get_input(delta):
	get_mouse_input()

	roll_input = -Input.get_axis("ui_left", "ui_right")

	throttle_input = Input.get_axis("ui_down", "ui_up")
	throttle = move_toward(throttle, throttle_input, delta * throttle_rate)


	calculate_applied_forces()


func calculate_applied_forces():
	applied_linear_force = linear_force * (global_transform.basis.z * -throttle_input)
	applied_angular_force = angular_force * Vector3(pitch_input, yaw_input, roll_input)


func get_mouse_input():
	var mouse_viewport_pos: Vector2 = get_viewport().get_mouse_position()
	var viewport_size: Vector2i = get_viewport().size

	pitch_input = -((mouse_viewport_pos.y - (viewport_size.y * 0.5)) / (viewport_size.y * 0.5))
	yaw_input = -((mouse_viewport_pos.x - (viewport_size.x * 0.5)) / (viewport_size.x * 0.5))

	pitch_input = clampf(pitch_input, -1, 1)
	yaw_input = clampf(yaw_input, -1, 1)
