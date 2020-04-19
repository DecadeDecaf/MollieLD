if (room != rm_Menu) {
	if (global.Tries == 0) {
		with (obj_Graffiti) {
			instance_destroy()
		}
		repeat (3) {
			var spawnX = random_range(0, room_width)
			var spawnY = random_range(0, room_height)
			instance_create_depth(spawnX, spawnY, 101, obj_Graffiti)
		}
		with (obj_Graffiti) {
			x += 10000
			var graffiti = instance_nearest(x - 10000, y, obj_Graffiti)
			x -= 10000
			if (graffiti != id && place_meeting(x, y, graffiti)) {
				instance_destroy()
			}
		}
	}
}