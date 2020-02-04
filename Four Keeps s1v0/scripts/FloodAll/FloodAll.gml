///@function FloodCheck()

var tm = "map";
var curTile;
var curSpot;
var newTile;
var newSpot;

var checklist = ds_stack_create();
var completed = ds_list_create();

for(var i = 0; i < 40; i++){
	for(var j = 0; j < 25; j += 24){
		curTile = GetTile(tm, i, j);
		curSpot = i+(j*40);
		if((curTile == 11) || (curTile == 255)){
			ds_stack_push(checklist, curSpot);	
		}
	}
}

for(var i = 0; i < 40; i += 39){
	for(var j = 1; j < 25; j++){
		curTile = GetTile(tm, i, j);
		curSpot = i+(j*40);
		if((curTile == 11) || (curTile == 255)){
			ds_stack_push(checklist, curSpot);	
		}
	}
}

while(!ds_stack_empty(checklist)){
	curSpot = ds_stack_pop(checklist);
	
	if((curSpot == noone) || (curSpot < 0) || (curSpot > 1000)){
		//do nothing if spot is out of bounds
	}
	else if(ds_list_find_index(completed, curSpot) != -1){
		//item already in the list, do nothing	
	}
	else{
		ds_list_add(completed, curSpot);
		
		for(var xx = -1; xx <= 1; xx++){
			for(var yy = -1; yy <= 1; yy += 1){

				newSpot = curSpot+xx+(yy*40);
				if((newSpot < 0) || (newSpot > 1000)){
					//out of bounds
				}
				else{
					newTile = GetTile(tm, newSpot%40, floor(newSpot/40));
				
					if((newTile == noone) || (newTile == -1)){
						//if empty, do nothing
					}
					else if((newTile == 44) || (newTile == 264)){
						//if wall, do nothing
					}
					else if((newTile == 141) || (newTile == 361)){
						SetTile(tm, 11, newSpot%40, floor(newSpot/40));
						ds_stack_push(checklist, newSpot);	
					}
					else if((newTile == 11) || (newTile == 255)){

						ds_stack_push(checklist, newSpot);	
					}
				}
			}
		}
	}
}

//at this point, the entire perimeter and all touching pieces (not blocked by walls) are listed

for(var i = 1; i < 39; i++){
	for(var j = 1; j < 24; j++){
		curSpot = i+(j*40);
		if(ds_list_find_index(completed, curSpot) != -1){
			
		}
		else{
			var c = 10;
			ds_list_add(completed, curSpot);
			var xx = i;
			curTile = GetTile(tm, i, j);
			
			if(curTile == 11){
							
				var checking = true;
				while(checking){
					xx--;
					newTile = GetTile(tm, xx, j);
				
					//if hits left edge first, it is player 2; if it hits river first, player 1
					if(xx <= 0){
						c = 361;
						checking = false;
					}
					else if(newTile == 255){
						c = 141;	
						checking = false;
					}
	
				}
				SetTile(tm, c, i, j);
			}
			
			
		}
		
	}
}

return completed;




