extends Node3D

@export var speed := 2.0

@onready var platform: MeshInstance3D = $Platform
@onready var move_point: Node3D = $MovePoint
@onready var area_3d: Area3D = $Area3D

var initial_pos := Vector3(0.0, 0.0, 0.0)
var state := false
var within := false
var frac := 0.0

func _ready() -> void:
	initial_pos = platform.global_position
	
func _process(delta: float) -> void:
	var frac_target := 1.0 if state else 0.0
	if Input.is_action_just_pressed("interact") and abs(frac_target - frac) < 0.1 and within:
		state = !state
	frac = lerp(frac, frac_target, delta * speed)
	platform.global_position = lerp(initial_pos, move_point.global_position, frac)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		within = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		within = false
