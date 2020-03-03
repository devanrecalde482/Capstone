
image_xscale = size*2*velocity;
size += velocity;

var tile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("map")),bbox_left,bbox_top);
if( (tile == 44) || (tile == 264))
	tilemap_set_at_pixel(layer_tilemap_get_id(layer_get_id("map")),11,bbox_left,bbox_top);
	
	alarm[0]= velocity