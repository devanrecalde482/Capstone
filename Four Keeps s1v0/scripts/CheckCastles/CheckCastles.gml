///@function CheckCastles()
///@description check players' castles

FloodAll();

with(o_Player){
	var tcast;
	var c = 1;
	num_castles_enclosed = 0;

	for(var i = 0; i < 4; i++){
		tcast = list_castles[i];

		if(color == c_blue){
			c = 141;
		}
		else if(color == c_red){
			c = 361;
		}
		
		var tile = GetTile("map", floor(tcast.x/32), floor(tcast.y/32));
		if(tile == c){
			num_castles_enclosed++;
			tcast.enclosed = true;
			tcast.image_index = 1;
		}
		else if(tcast.enclosed){
			tcast.enclosed = false;
			tcast.image_index = 0;
		}

	}
}