///@function Add_To_Grid(object, objectType)

var curObject = argument0;
var objectType = argument1;

//TODO: Split tetris piece into singles
var startX = curObject.bbox_left;
var startY = curObject.bbox_top;

var endX = curObject.bbox_right;
var endY = curObject.bbox_bottom;

var spot = 0;

for(var yy = startY; yy < endY; yy += 32){
	for(var xx = startX; xx < endX; xx += 32){
		if(!position_empty(xx, yy)){
			if(objectType == o_TetrisPiece){
				spot = 2;
			}
			//else if(objectType == o_Cannon){
			//	spot = 5;
			//}
			global.map_grid[floor(yy/32), floor(xx/32)] = ((10*curObject.player.num) + spot);
		}
		
	}
}




