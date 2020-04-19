if (room == rm_Menu) {
	draw_set_color($272727)
	draw_rectangle(0, 0, 1920, 140, false)
	draw_rectangle(0, 420, 1920, 1080, false)
	draw_set_color($3D3D3D)
	draw_rectangle(0, 395, 1920, 420, false)
	draw_set_color($FFFFFF)
	var offsetX = random_range(-2, 2)
	var offsetY = random_range(-1, 0)
	draw_sprite(spr_Logo, 0, 960 + offsetX, 270 + offsetY)
	draw_text_transformed(960 + offsetX, 360 + offsetY, "Made in 48 hours for the Ludum Dare 46 by DecadeDecaf\nO                                                            O", 0.25, 0.25, 0)
	draw_set_color($858585)
	draw_text_transformed(960, 540, "Press Spacebar or A to Start", 0.5, 0.5, 0)
	draw_set_color($5D5D5D)
	draw_text_transformed(960, 640, "Press F to Toggle Fullscreen\n\nPress M to Toggle Mute\n\nPress ESC to Quit", 0.333, 0.333, 0)
} else {
	var txt = ""
	switch (global.Level) {
		case 1: txt = "Mollie"; break
		case 2: txt = "Ollie"; break
		case 3: txt = "Double Ollie"; break
		case 4: txt = "Stick the Landing"; break
		case 5: txt = "Transitions"; break
		case 6: txt = "Downstairs"; break
		case 7: txt = "Midair Jump"; break
		case 8: txt = "Upstairs?"; break
		case 9: txt = "Ollie Oop"; break
		case 10: txt = "Speed"; break
		case 11: txt = "Grind"; break
		case 12: txt = "Wait For It"; break
		case 13: txt = "Keep It Alive"; break
		case 14: txt = "Race"; break
		case 15: txt = "Tricks"; break
		case 16: txt = "Upwards"; break
	}
	draw_set_color($858585)
	draw_text_transformed(960, 20, "Level " + string(global.Level), 0.333, 0.333, 0)
	draw_set_color($5D5D5D)
	draw_text_transformed(960, 60, txt, 0.25, 0.25, 0)
	var minutes = string(floor(global.Timer / 60))
	var seconds = string_format(global.Timer % 60, 1, 1)
	if (string_length(seconds) < 4) {
		seconds = "0" + seconds
	}
	var time = minutes + ":" + seconds
	draw_text_transformed(960, 1020, time, 0.25, 0.25, 0)
}