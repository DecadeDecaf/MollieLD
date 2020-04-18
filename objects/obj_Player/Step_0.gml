var right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) > 0.25
var left = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_axis_value(0, gp_axislh) < -0.25
var up = keyboard_check(ord("W")) || keyboard_check(vk_up) || keyboard_check(vk_space) || gamepad_button_check(0, gp_face1)
var down = keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_button_check(0, gp_face3)

var board = instance_nearest(x, bbox_bottom, obj_Skateboard)

if (up && Grounded) {
	HeldUp = 10
	YV = -10
	y += YV
	var ollie = instance_create_depth(x, bbox_bottom, 0, obj_Skateboard)
	ollie.YV = YV / 2
	ollie.XV = XV * 1.25
	Grounded = false
} else if (up && HeldUp > 0) {
	YV -= 1
	HeldUp -= 1
} else if (!up && HeldUp > 0) {
	HeldUp = 0
}

YV += Gravity / 1.5

if (down) {
	YV += Gravity / 1.5
}

if (right) {
	XV += 2.5
	Facing = 1
} else if (left) {
	XV -= 2.5
	Facing = -1
}

XV /= 1.25

YV = median(-20, YV, 20)
XV = median(-10, XV, 10)

y += YV

if (YV > 0) {
	if (!Grounded) {
		if (scr_Collision(bbox_right, bbox_bottom) || scr_Collision(bbox_left, bbox_bottom)) {
			scr_Die()
		} else if (instance_exists(board)) {
			if (position_meeting(bbox_right, bbox_bottom, board) || position_meeting(bbox_left, bbox_bottom, board)) {
				Grounded = true
				instance_destroy(board)
				y -= YV
				YV = 0
				HeldUp = 0
			}
		}
	} else {
		if (scr_Collision(bbox_right, bbox_bottom) || scr_Collision(bbox_left, bbox_bottom)) {
			y -= YV
			YV = 0
			HeldUp = 0
		}
	}
} else if (YV < 0) {
	if (!Grounded) {
		if (scr_Collision(bbox_right, bbox_top) || scr_Collision(bbox_left, bbox_top)) {
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

if (scr_Win(bbox_right, bbox_bottom) || scr_Win(bbox_left, bbox_bottom)) {
	if (room_exists(room_next(room))) {
		room_goto_next()
	}
}