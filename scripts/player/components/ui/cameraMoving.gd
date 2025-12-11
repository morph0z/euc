extends component
class_name cameraMoving
@export var camera:Camera3D

func move_camera(delta:float, position:Vector3, offset:Vector3 = Vector3.ZERO, fov_change:float = 75, interpolate:bool = true) -> void:
	if interpolate:
		camera.position.x = move_toward(camera.position.x, position.x, delta)
		camera.position.z = move_toward(camera.position.z, position.z, delta)
		camera.position.y = move_toward(camera.position.y, position.y, delta)
		camera.h_offset = move_toward(camera.h_offset, offset.x, delta)
		camera.v_offset = move_toward(camera.v_offset, offset.y, delta)
		camera.fov = move_toward(camera.fov, fov_change, delta)
		
	elif !interpolate:
		camera.position.x = position.x
		camera.position.z = position.z
		camera.position.y = position.y
		camera.h_offset = offset.x
		camera.v_offset = offset.y
		camera.fov = fov_change

func move_camera_out_of_way(delta:float, offset:float, interpolate:bool = true) -> void:
	if interpolate:
		camera.position.z = move_toward(camera.position.z, offset, delta)
	elif !interpolate:
		camera.position.z = offset
		
