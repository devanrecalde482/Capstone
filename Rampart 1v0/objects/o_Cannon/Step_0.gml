///@description Movement


var xx = x;
var yy = y;

if(can_move){
	
	//up
	if(keyboard_check_pressed(player.keybinds[0])){
		y -= global.tile_size;
	}

	//down
	if(keyboard_check_pressed(player.keybinds[1])){
		y += global.tile_size;
	}

	//left
	if(keyboard_check_pressed(player.keybinds[2])){
		x -= global.tile_size;
	}

	//right
	if(keyboard_check_pressed(player.keybinds[3])){
		x += global.tile_size;
	}

	//switch
	if(keyboard_check_pressed(player.keybinds[4])){
		//change to alternate cannons if available
		//like how 3 cannons = 1 balloon, 4 = 2x2 big cannon that shoots fireballs
	}
	
	if(!Valid_move(self)){
		x = xx;
		y = yy;
	}
	
	//if valid spot, as in, inside my territory
	
	if(place_empty(x,y)){
		image_alpha = 1;	
		valid_spot = true;
	}
	else{
		image_alpha = .5;
		valid_spot = false;
	}
	

	//place
	if(keyboard_check_pressed(player.keybinds[5])){
		if(valid_spot){
			can_move = false;
			player.list_cannons[player.num_of_cannons] = self;
			layer = layer_get_id("pieces");
				
			player.num_of_cannons++;
			player.saved_cannons--;
			
			if(player.saved_cannons > 0){
				player.cursor = instance_create_layer(x, y, "UI", player.cannon);
				player.cursor.player = player;
				player.cursor.can_move = true;
			}
			else{
				player.can_place_cannon = false;
				player.cursor = noone;
			}
		}
	}


}









