extends Node3D

var XR_interface: XRInterface

#This is like int main() in C
func _ready() -> void:
	XR_interface = XRServer.find_interface("OpenXR") # Make sure we use regular OpenXR instead of Oculus or Meta or some other weirdness
	
	if XR_interface.is_initialized():
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED) # V-sync can cause visual tomfoolery
		get_viewport().use_xr = true
		
	else:
		printerr("OH MY GOD WHY WONT THE XR INITIALISE???")
