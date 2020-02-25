///@function CheckCastles()
///@description check players' castles

with(o_Player){
	var tcast;
	var myPlayer = 0;
	num_castles_enclosed = 0;

	for(var i = 0; i < 4; i++){
		tcast = list_castles[i];

		if(color == c_blue){
			myPlayer = 1;
		}
		else if(color == c_red){
			myPlayer = 2;
		}
		
		var spot = global.map_grid[floor(tcast.y/32), floor(tcast.x/32)];

		if((spot % 10) == 1){
			num_castles_enclosed++;
			tcast.enclosed = true;
			tcast.image_index = 1;
		}
		else if(tcast.enclosed){
			//num_castles_enclosed--;
			tcast.enclosed = false;
			tcast.image_index = 0;
		}

	}
	
	
}