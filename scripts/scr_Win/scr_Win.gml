var lay = layer_get_id("Tiles")
var map = layer_tilemap_get_id(lay)

var tile = tilemap_get_at_pixel(map, argument[0], argument[1])
var coll = false

if (tile == 2) {
	coll = true
}

return coll