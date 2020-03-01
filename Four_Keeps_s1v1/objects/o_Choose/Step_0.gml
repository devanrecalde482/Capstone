///@description Movement


if(can_move){
	if( (player != noone) && (player.can_move) ){
	
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
		//move_snap(32, 32);
				
		//choose starting castle
		if(keyboard_check_pressed(player.keybinds[5])){
			player.can_move = false;
			player.list_castles[player.starting_castle].image_index = 1;
			player.startX = x;
			player.startY = y;
			player.cursor = noone;
			
			
			var curPiece = instance_create_layer(x, y, "pieces", o_Single);
			curPiece.player = player;
			var newPiece;
			
			//move_snap(32, 32);
		
			//create walls around the castle
			with(curPiece){
				//BUG: the move snap here makes the lower castles innacurate
                                                                                                                           
				//move_snap(32, 32);
				
				x -= (32*5);
				y -= (32*4);
				move_snap(32, 32);
				
	
				newPiece = instance_create_layer(x, y, "pieces", o_Single);
				newPiece.player = player;
				//move_snap(32, 32);
				
				//BUG: these are making the floors the wrong player color
				global.map_grid[floor(y/32), floor(x/32)] = ((10*player.num) + 2);

				for(var i = 0; i < 7; i++){
					x += 32;
					//move_snap(32, 32);
					newPiece = instance_create_layer(x, y, "pieces", o_Single);
					newPiece.player = player;
					global.map_grid[floor(y/32), floor(x/32)] = ((10*player.num) +2);
				
				}
			
				for(var j = 0; j < 7; j++){
					y += 32;
					//move_snap(32, 32);
					newPiece = instance_create_layer(x, y, "pieces", o_Single);
					newPiece.player = player;
					global.map_grid[floor(y/32), floor(x/32)] = ((10*player.num) +2);
				
				}
				for(var i = 0; i < 7; i++){
					x -= 32;
					//move_snap(32, 32);
					newPiece = instance_create_layer(x, y, "pieces", o_Single);
					newPiece.player = player;
					global.map_grid[floor(y/32), floor(x/32)] = ((10*player.num) +2);
				
				}
			
				for(var j = 0; j < 6; j++){
					y -= 32;
					//move_snap(32, 32);
					newPiece = instance_create_layer(x, y, "pieces", o_Single);
					newPiece.player = player;
					global.map_grid[floor(y/32), floor(x/32)] = ((10*player.num) + 2);
				}

				instance_destroy(curPiece);
			}
			
			FloodAll();
			CheckCastles();
			

			instance_destroy( self );
		}
	}
}

	
	


