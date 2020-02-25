///@function FloodAll()


//TODO: add parameter to be used when players play a piece;
//this is so that if player 1 sets a piece, the entire map doesn't need
//to be checked


var curSpot;
var newSpot;

var checklist = ds_stack_create();

var checked; //boolean 2d array for if a spot is checked
for(var i = 0; i < global.map_width; i++){
	for(var j = 0; j < global.map_height; j++){
		checked[j, i] = false;
	}
}

//check the perimeter and all spots not enclosed
ds_stack_push(checklist, 0);
while(!ds_stack_empty(checklist)){
	curSpot = ds_stack_pop(checklist);
	var xx = floor(curSpot % global.map_width);
	var yy = floor(curSpot / global.map_width);
	
	if(!checked[yy, xx]){
		checked[yy, xx] = true;
		
		//check spots around current spot
		for(var i = -1; i <= 1; i++){
			for(var j = -1; j <= 1; j += 1){

				if( ( xx+i < 0) || (xx+i >= global.map_width) || (yy+j < 0) || (yy+j >= global.map_height) ){
					//out of bounds
				}
				else if(!checked[yy+j, xx+i]){
					
					newSpot = global.map_grid[yy+j, xx+i];
					var q = floor(newSpot / 10);	
					var r = (newSpot % 10);	
					
					switch(r){	
						case 0: //normal land
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
						case 1: //river or interior
							if(q != 0){
								r = 0;
							}
							global.map_grid[yy+j, xx+i] = q*10+r;
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
						case 2: //wall
							checked[yy+j, xx+i] = true;
							global.map_grid[yy+j, xx+i] = q*10 + 2;
							break;
						default: //cannon, castle, etc
							global.map_grid[yy+j, xx+i] = q*10;
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
					}

				}
			}
		}
	}
}

//at this point, the only unchecked spots should be interiors
//so this will go through and change them accordingly
for(var xx = 0; xx < global.map_width; xx++){
	for(var yy = 0; yy < global.map_height; yy++){
		if(!checked[yy, xx]){
			checked[yy, xx] = true;
			curSpot = global.map_grid[yy, xx];
			
			var q = floor(curSpot / 10);
			
			/*can be used to double check values
			var r = (curSpot % 10);	
			if r = x y z
			r = 1;
			*/
			
			global.map_grid[yy, xx] = q*10 + 1;
		}
	}
	
}

for(var xx = 0; xx < global.map_width; xx++){
	for(var yy = 0; yy < global.map_height; yy++){
		var value = global.map_grid[yy, xx];
		var t = 0;

		if(value == 0){
			t = 1;
		}
		else if(value == 1){
			t = 2;
		}
		else{
			var q = floor(value / 10);
			var r = (value % 10);
			if(r == 0){
				r = 2;
			}
			else if( (r >= 1) && (r <= 5)){
				r = 1;
			}

			t = q*3 + r;
		}

		//layer_set_visible(layer_get_id("tl_build"), visible);
		tilemap_set(layer_tilemap_get_id("tl_build"), t, xx, yy);
		
	}	
}
			





