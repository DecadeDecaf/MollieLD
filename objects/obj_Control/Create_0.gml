randomize()

display_reset(8, true)
draw_set_font(fnt_Font)
draw_set_halign(fa_center)
draw_set_circle_precision(64)

gamepad_set_axis_deadzone(0, 0.25)

audio_play_sound(snd_Game, 1, true)
global.Muted = false

global.FrameCount = 0
global.Timer = 0
global.Level = 1

repeat (12) {
	var spawnX = random_range(-128, 2048)
	var spawnY = random_range(140, 420)
	instance_create_depth(spawnX, spawnY, 0, obj_Speed)	
}