
if(fired){
	move_towards_point(targetX, targetY, velocity);
	fired = false;
}
temp = distance_to_point(targetX,targetY);
if(!Valid_move(self)){
	instance_destroy(self);
	source.cooldown = false;
}

else if(  temp = 0 ){
		var tile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("map")),x,y);
		
		if( (tile == 44) || (tile == 264))
			tilemap_set_at_pixel(layer_tilemap_get_id(layer_get_id("map")),11,x,y);
	source.cooldown = false;
	instance_destroy(self);
}

