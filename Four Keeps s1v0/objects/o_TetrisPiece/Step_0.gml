///@description Movement

var xx = x;
var yy = y;

if(player.can_move){
	
	//up
	if(keyboard_check_pressed(player.keybinds[0])){
		y -= global.tile_size;
	}

	//down
	else if(keyboard_check_pressed(player.keybinds[1])){
		y += global.tile_size;
	}

	//left
	else if(keyboard_check_pressed(player.keybinds[2])){
		x -= global.tile_size;
	}

	//right
	else if(keyboard_check_pressed(player.keybinds[3])){
		x += global.tile_size;
	}

	//rotate
	else if(keyboard_check_pressed(player.keybinds[4])){
		
		image_angle += 90;

		
	}

	if( !Valid_move( self ) ){
		x = xx;
		y = yy;
	}
	
	
	if(Check_Tile(self, o_TetrisPiece) && place_empty(x,y)){
		valid_spot = true;
	}
	else{
		valid_spot = false;
	}
	
	if(valid_spot){
		image_alpha = 1;
	}
	else{
		image_alpha = 0.5;
	}

	//place
	if(keyboard_check_pressed(player.keybinds[5])){
		if(valid_spot){
			Draw_to_Tilemap(self, o_TetrisPiece);

			CheckCastles();

			var range = ds_list_size(player.tPieces)-1;
			if(global.curRound <2){
				range = 2;
			}
		
			var newPiece = instance_create_layer(x, y, "UI", ds_list_find_value(player.tPieces, irandom_range(0,range)));
			player.piece = newPiece;
			newPiece.player = player;

			instance_destroy(self);

		}
	}

}











