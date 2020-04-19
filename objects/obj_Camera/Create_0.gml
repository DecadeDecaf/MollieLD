x = obj_Player.x
y = obj_Player.y

Camera = camera_create()

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)
var pm = matrix_build_projection_ortho(1920, 1080, 1, 10000)

camera_set_view_mat(Camera, vm)
camera_set_proj_mat(Camera, pm)

view_camera[0] = Camera