image_xscale = 0.225 * Facing

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
		} else {
			sprite_index = spr_Idle
		}
	} else {
		sprite_index = spr_Jumping
	}
}

draw_self()