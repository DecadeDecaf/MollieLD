var lay = layer_get_id("Tiles")
var map = layer_tilemap_get_id(lay)

var tile = 9

if (scr_Collision(x, bbox_bottom)) {
	tile = tilemap_get_at_pixel(map, x, bbox_bottom)
} else if (scr_Collision(bbox_right, bbox_bottom)) {
	tile = tilemap_get_at_pixel(map, bbox_right, bbox_bottom)
} else if (scr_Collision(bbox_left, bbox_bottom)) {
	tile = tilemap_get_at_pixel(map, bbox_left, bbox_bottom)
}

return tile