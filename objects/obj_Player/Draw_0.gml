image_xscale = 0.225 * Facing

var stop = false

if (sprite_index != spr_Dead) {
	if (Grounded) {
		if (abs(XV) > 1) {
			sprite_index = spr_Skating
			if (image_index == 3) {
				repeat (5) {
					var dust = instance_create_depth(x, bbox_bottom, 0, obj_Dust)
					if (XV > 0) {
						dust.Direction = random_range(150, 180)
						dust.Speed = random_range(4, 6)
					} else {
						dust.Direction = random_range(0, 30)
						dust.Speed = random_range(4, 6)
					}
				}
			}
			if (abs(YV) < 1) {
				if (!audio_is_playing(snd_Skating)) {
					audio_sound_gain(snd_Skating, 1, 50)
					audio_play_sound(snd_Skating, 1, true)
				}
			}
		} else {
			sprite_index = spr_Idle
			stop = true
		}
	} else {
		sprite_index = spr_Jumping
		stop = true
	}
} else {
	stop = true
}

if (stop) {
	var roll = false
	with (obj_Skateboard) {
		if (abs(XV) > 1) {
			roll = true
		}
	}
	if (!roll) {
		audio_stop_sound(snd_Skating)
	} else {
		audio_sound_gain(snd_Skating, 0.5, 50)
	}
}

draw_self()