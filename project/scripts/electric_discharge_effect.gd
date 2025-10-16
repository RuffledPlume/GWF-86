class_name ElectricDischarge
extends Node3D

@onready var rings: GPUParticles3D = $Rings
@onready var discharge: GPUParticles3D = $Discharge

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		rings.emitting = true
		discharge.emitting = true
