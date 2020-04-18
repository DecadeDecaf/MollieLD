image_xscale = 0.225 * Facing

if (sprite_index != spr_Dead) {
	if (Grounded) {
		if (abs(XV) > 1) {
			sprite_index = spr_Skating
		} else {
			sprite_index = spr_Idle
		}
	} else {
		sprite_index = spr_Jumping
	}
}

draw_self()