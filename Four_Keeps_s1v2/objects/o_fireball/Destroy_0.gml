/// @description 
// check around when destroyed to see if walls are there and destroy any in that range

instance_create_layer(x,y,"pieces",o_explosion);
for(j = -1; j <= 1; j++)
{
yy = (y + global.tile_size * j);
	for(i = -1; i <= 1; i++)
	{
		xx = (x + global.tile_size * i);
		var tile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("map")),xx,yy);
		
		if( (tile == 44) || (tile == 264))
			tilemap_set_at_pixel(layer_tilemap_get_id(layer_get_id("map")),11,xx,yy);
	}
}
