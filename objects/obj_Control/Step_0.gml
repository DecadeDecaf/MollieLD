var f = keyboard_check_pressed(ord("F"))
var m = keyboard_check_pressed(ord("M"))
var space = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)
var esc = keyboard_check_pressed(vk_escape)

global.FrameCount += 1

if (room == rm_Menu) {
	if (global.FrameCount % 6 == 0) {
		var spawnY = random_range(140, 420)
		instance_create_depth(2048, spawnY, 0, obj_Speed)
	}
} else {
	if (global.FrameCount % 6 == 0) {
		global.Timer += 0.1
	}
}

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
		audio_master_gain(0)
		global.Muted = true
	}
}

if (space && room == rm_Menu) {
	room_goto(rm_Mollie)
}

if (esc) {
	game_end()
}