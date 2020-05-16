var spot = global.map_grid[floor(y/32), floor(x/32)];
if( (spot % 10 == 0) && ( spot / 10  > 0)){
	instance_create_layer(x,y,"pieces",o_Crater);
}


