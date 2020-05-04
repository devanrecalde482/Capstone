 
if(fired){
	move_towards_point(targetX, targetY, velocity);
	fired = false; 
}

if(!Valid_move(self)){
	source.alarm[0] = global.gSpeed;
	instance_destroy(self);
}
else if( distance_to_point(targetX,targetY) <= global.tile_size ){
	//targetX = 32*(floor(targetX / 32));
	//targetY = 32*(floor(targetY / 32));
	var wall = instance_position(x, y, o_TetrisPiece);
	if(wall != noone){
		global.map_grid[floor(y/32), floor(x/32)]--;
		instance_destroy(wall);
	}
	
	source.alarm[0] = source.cooldown * global.gSpeed;
	instance_destroy(self);
}



