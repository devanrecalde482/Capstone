///@function Check_Tile(object, objectType)
///@description checks if parts of an object's sprite are valid or not
///@param object object we are checking
///@param checking type of object


var curObject = argument0;
var objectType = argument1;
//if object has no sprite, error

var tm = layer_tilemap_get_id(layer_get_id("map"));


//adding 1 just to make sure i'm in the area
var startX = curObject.bbox_left;
var startY = curObject.bbox_top;

var endX = curObject.bbox_right;
var endY = curObject.bbox_bottom;


var valid = true;
var curTile;

for(var yy = startY; (yy < endY) && valid; yy += 32){
	for(var xx = startX; (xx < endX) && valid; xx += 32){

		if(!position_empty(xx, yy)){
			curTile = tilemap_get_at_pixel(tm, xx, yy);
			
			if(objectType == o_TetrisPiece){
				if((curTile == 11) || (curTile == 141) || (curTile == 361)){
						
				}
				else{
					valid = false
				}
					
				
			}
			else if(objectType == o_Cannon){
				if((curTile == 44) || (curTile == 264)){
					//TODO: also check if a spot is a wall
				}
				else{
					valid = false;	
				}
				
			}

		}
		
	}
}

return valid;



