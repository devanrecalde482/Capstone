///@function CheckCastles()
///@description check players' castles

with(o_Player){
	var tCap;
	num_castles_enclosed = 0;

	for(var i = 0; i < global.numOfCapturables; i++){
		tCap = list_capturables[i];

		var spot = global.map_grid[floor(tCap.y/32), floor(tCap.x/32)];

		if((spot % 10) == 1){
			tCap.enclosed = true;
			if(tCap.object_index == o_Castle){
				num_castles_enclosed++;
				tCap.image_index = 1;
			}
		}
		else{
			tCap.enclosed = false;
			if(tCap.object_index == o_Castle){
				tCap.image_index = 0;
			}
		}
	}
	
	//TODO: Check if cannons are enclosed too
	
}