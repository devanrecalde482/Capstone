///@description Movement


if(can_move){
	
	//next
	if(keyboard_check_pressed(player.keybinds[0]) || keyboard_check_pressed(player.keybinds[2])){
		player.starting_castle++;
		if(player.starting_castle > 3){
			player.starting_castle = 0;
		}
	}

	//previous
	else if(keyboard_check_pressed(player.keybinds[1]) || keyboard_check_pressed(player.keybinds[3])){
		player.starting_castle--;
		if(player.starting_castle < 0){
			player.starting_castle = 3;
		}
	}
			
	x = player.list_castles[player.starting_castle].x;
	y = player.list_castles[player.starting_castle].y;
				
	//choose starting castle
	if(keyboard_check_pressed(player.keybinds[5])){
		player.can_move = false;
		player.list_castles[player.starting_castle].image_index = 1;
		player.startX = x;
		player.startY = y;
		player.cursor = noone;
			
		var c, cc, curSpot;
		//c is wall color, cc is territory color
		if(player.color == c_blue){
			c = 44;
			cc = 141;
		}
		else if(player.color == c_red){
			c = 264;
			cc = 361;
		}
			
		//create walls around the castle
		{
				
			var tm = "map";
			var tx = floor(x/32);
			var ty = floor(y/32);
			tx -= 4;
			ty -= 3;
			for(var i = 0; i < 8; i++){
				SetTile(tm, c, tx+i, ty-1);
				SetTile(tm, c, tx+i, ty+6);
			}
			for(var j = 0; j < 6; j++){
				SetTile(tm, c, tx, ty+j);
				SetTile(tm, c, tx+7, ty+j);
			}
		}
			
		CheckCastles();
			
			
			
		instance_destroy( self );
	}

}

	
	


