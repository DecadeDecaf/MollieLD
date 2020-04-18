x -= (x - obj_Player.x) / 10
y -= (y - obj_Player.y) / 10

var camX = median(960, x, room_width - 960)
var camY = median(540, y, room_height - 540)

var vm = matrix_build_lookat(camX, camY, -10, camX, camY, 0, 0, 1, 0)
camera_set_view_mat(Camera, vm)