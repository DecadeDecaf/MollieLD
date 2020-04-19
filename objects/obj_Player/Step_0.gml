var right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) > 0.25
var left = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_axis_value(0, gp_axislh) < -0.25
var up = keyboard_check(ord("W")) || keyboard_check(vk_up) || keyboard_check(vk_space) || gamepad_button_check(0, gp_face1)
var down = keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_axis_value(0, gp_axislv) > 0.25 || gamepad_button_check(0, gp_face3)

var board = instance_nearest(x, bbox_bottom, obj_Skateboard)

if (sprite_index == spr_Dead) {
	right = false
	left = false
	up = false
	down = false
}

if (!scr_Collision(bbox_right, bbox_top) && !scr_Collision(x, bbox_top) && !scr_Collision(bbox_left, bbox_top)) {
	if (up && Grounded) {
		HeldUp = 10
		var oldYV = YV
		YV = -12
		oldYV += YV
		y += YV
		var ollie = instance_create_depth(x, bbox_bottom, 0, obj_Skateboard)
		ollie.YV = oldYV / 2
		ollie.XV = XV * 1.25
		Grounded = false
		audio_play_sound(snd_Jump, 1, false)
	} else if (up && HeldUp > 0) {
		YV -= 1
		HeldUp -= 1
	} else if (!up && HeldUp > 0) {
		HeldUp = 0
	}
}

YV += Gravity / 1.5

if (down) {
	YV += Gravity / 1.5
}

if (right) {
	XV += 3
	Facing = 1
} else if (left) {
	XV -= 3
	Facing = -1
}

if (sprite_index == spr_Dead) {
	XV /= 1.25
} else {
	XV /= 1.2
}

YV = median(-20, YV, 20)
XV = median(-12.5, XV, 12.5)

y += YV

if (YV > 0) {
	if (!Grounded) {
		if (scr_Collision(bbox_right, bbox_bottom) || scr_Collision(x, bbox_bottom) || scr_Collision(bbox_left, bbox_bottom)) {
			scr_Die()
		} else if (instance_exists(board) && sprite_index != spr_Dead) {
			if (position_meeting(bbox_right, bbox_bottom, board) || position_meeting(x, bbox_bottom, board) || position_meeting(bbox_left, bbox_bottom, board)) {
				Grounded = true
				instance_destroy(board)
				y -= YV
				YV = 0
				HeldUp = 0
				repeat (10) {
					var dust = instance_create_depth(x, bbox_bottom, 0, obj_Dust)
					if (choose(true, false)) {
						dust.Direction = random_range(135, 180)
						dust.Speed = random_range(4, 6)
					} else {
						dust.Direction = random_range(0, 45)
						dust.Speed = random_range(4, 6)
					}
				}
				audio_play_sound(snd_Land, 1, false)
			}
		}
	} else {
		if (scr_Collision(bbox_right, bbox_bottom) || scr_Collision(x, bbox_bottom) || scr_Collision(bbox_left, bbox_bottom)) {
			var tile = scr_Floor()
			y -= YV
			YV = 0
			HeldUp = 0
			if (tile == 4) {
				YV = -16
			} else if (tile == 5) {
				XV += 2
			} else if (tile == 6) {
				XV -= 2
			}
		}
	}
} else if (YV < 0) {
	if (!Grounded) {
		if (scr_Collision(bbox_right, bbox_top) || scr_Collision(x, bbox_top) || scr_Collision(bbox_left, bbox_top)) {
			y -= YV
			YV = 0
			HeldUp = 0
		}
	}
}

x += XV

if ((XV > 0 && scr_Collision(bbox_right, bbox_bottom)) || (XV < 0 && scr_Collision(bbox_left, bbox_bottom))) {
	x -= XV
	XV = 0
}

if ((XV > 0 && scr_Collision(bbox_right, y)) || (XV < 0 && scr_Collision(bbox_left, y))) {
	x -= XV
	XV = 0
}

if ((XV > 0 && scr_Collision(bbox_right, bbox_top)) || (XV < 0 && scr_Collision(bbox_left, bbox_top))) {
	x -= XV
	XV = 0
}

if (bbox_top > room_height) {
	scr_Die()
}

if (scr_Win(bbox_right, bbox_bottom) || scr_Win(x, bbox_bottom) ||scr_Win(bbox_left, bbox_bottom)) {
	if (room_exists(room_next(room)) && sprite_index != spr_Dead) {
		room_goto_next()
		global.Level += 1
	}
}