//need an object

var curObject = argument0;
var objectType = argument1;

var tm = layer_tilemap_get_id(layer_get_id("map"));

var newTile = 0;

if( objectType == o_TetrisPiece){
	var startX = curObject.bbox_left;
	var startY = curObject.bbox_top;
	var endX = curObject.bbox_right;
	var endY = curObject.bbox_bottom;

	if(curObject.player.color == c_blue){
		newTile = 44
	}
	else{
		newTile = 264;
	}
	
	for(var curX = startX; curX < endX; curX += 32){
		for(var curY = startY; curY < endY; curY += 32){
			if(!position_empty(curX, curY)){
				tilemap_set_at_pixel(tm, newTile, curX, curY);
			}
		}
	}
}



else if(objectType == o_Cannon){
	var parts = [];
	if(curObject.player.color == c_blue){
		parts = [
			90,
			91,
			134,
			135,
		];
	}
	else if(curObject.player.color == c_red){
				parts = [
			310,
			311,
			354,
			355,
		];
	}
	var i = 0; 
	for(var curX = startX; curX < endX; curX += global.tile_size){
		for(var curY = startY; curY < endY; curY += global.tile_size){
			if(!position_empty(curX, curY)){
				tilemap_set_at_pixel(tm, parts[i], curX, curY);
				i++;
			}
		}
	}
	

}

else if(objectType == o_Ball){
	newTile = 11;
	var spot = tilemap_get_at_pixel(tm, curObject.x, curObject.y);
	if( (spot == 44) || (spot == 264)){
		tilemap_set_at_pixel(tm, newTile, curObject.x, curObject.y);
	}
	
}

