if (sprite_index != spr_Dead) {
	sprite_index = spr_Dead
	alarm[0] = 45
	Grounded = true
	audio_play_sound(snd_Die, 1, false)
	YV = -3
	global.Tries += 1
}