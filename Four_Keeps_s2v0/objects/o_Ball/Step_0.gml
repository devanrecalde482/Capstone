if(fired){
	move_towards_point(targetX, targetY, velocity);
	fired = false;
}

if(!Valid_move(self)){
	source.recharging = false;
	instance_destroy(self); 
}
else if( distance_to_point(targetX,targetY) <= 0 ){
	targetX = 32*(floor(targetX / 32));
	targetY = 32*(floor(targetY / 32));
	var wall = instance_position(x, y, o_TetrisPiece);
	if(wall != noone){
		global.map_grid[floor(y/32), floor(x/32)]--;
		instance_destroy(wall);
	}
	
	source.recharging = false;
	instance_destroy(self);
}



