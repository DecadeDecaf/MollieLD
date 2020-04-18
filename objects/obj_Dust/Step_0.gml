x += lengthdir_x(Speed, Direction)
y += lengthdir_y(Speed, Direction)

Speed /= 1.2

if (Speed < 1) {
	image_xscale -= 0.01
	image_yscale -= 0.01
	if (image_xscale <= 0) {
		instance_destroy()
	}
}