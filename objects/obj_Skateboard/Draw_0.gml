image_xscale = 0.225 * Facing

if (abs(XV) > 1) {
	if (!audio_is_playing(snd_Skating)) {
		audio_play_sound(snd_Skating, 1, true)
	}
}

draw_self()