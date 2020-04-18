var lay = layer_get_id("Tiles")
var map = layer_tilemap_get_id(lay)

var tile = tilemap_get_at_pixel(map, argument[0], argument[1])
var coll = false

if (tile == 1 || tile == 2 || tile == 4 || tile == 5 || tile == 6 || tile == 7) {
	coll = true
}

return coll