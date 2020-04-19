var lay = layer_get_id("Tiles")
var map = layer_tilemap_get_id(lay)

var offset = 0

if (sprite_index == spr_Jumping && argument[1] == bbox_bottom) {
	offset = 45
}

var tile = tilemap_get_at_pixel(map, argument[0], argument[1] - offset)
var coll = false

if (tile == 1 || tile == 2 || tile == 4 || tile == 5 || tile == 6 || tile == 7) {
	coll = true
}

return coll