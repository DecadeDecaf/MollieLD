var f = keyboard_check_pressed(ord("F"))
var m = keyboard_check_pressed(ord("M"))
var space = keyboard_check_pressed(vk_space)

if (f) {
	var full = window_get_fullscreen()
	window_set_fullscreen(!full)
	if (!full) {
		window_set_size(1920, 1080)
	} else {
		window_set_size(960, 540)
	}
}

if (m) {
	if (global.Muted) {
		audio_master_gain(1)
		global.Muted = false
	} else {
		audio_master_gain(1)
		global.Muted = true
	}
}

if (space && room == rm_Menu) {
	room_goto(rm_1)
}