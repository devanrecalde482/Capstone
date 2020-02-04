/// @description Build

show_message("Build your walls and fill any gaps");

//clear the map to then recheck for enclosure
var tile;
for(var i = 0; i < 40; i++){
	for(var j = 0; j < 25; j++){
		tile = GetTile("map", i, j);
		if((tile == 141) || (tile == 361)){
			SetTile("map", 11, i, j);
		}
	}
}

CheckCastles();

with(o_Player){

	move_snap(global.tile_size, global.tile_size);
	var range = ds_list_size(tPieces)-1;
	if(global.curRound <2){
		range = 2;
	}
		
	piece = instance_create_layer(startX, startY, "UI", ds_list_find_value(tPieces, irandom_range(0,range)));
	piece.player = self;
	can_move = true;
}

SetTimer(20);


