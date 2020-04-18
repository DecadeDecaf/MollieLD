YV += Gravity / 1.5

XV /= 1.015

YV = median(-20, YV, 20)
XV = median(-20, XV, 20)

y += YV

if (YV > 0) {
	if (scr_Collision(bbox_right, bbox_bottom) || scr_Collision(bbox_left, bbox_bottom)) {
		y -= YV
		YV = 0
	}
} else if (YV < 0) {
	if (scr_Collision(bbox_right, bbox_top) || scr_Collision(bbox_left, bbox_top)) {
		y -= YV
		YV = 0
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