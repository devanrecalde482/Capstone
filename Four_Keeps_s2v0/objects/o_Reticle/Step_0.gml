///@description Movement

var xx = x;
var yy = y;

if(player.can_move){

	//faster
	if(keyboard_check(player.keybinds[4])){
		move_speed = 8;
	}
	else{
		move_speed = 4;	
	}
	
	//up
	if(keyboard_check(player.keybinds[0])){
		y -= move_speed;
	}

	//down
	if(keyboard_check(player.keybinds[1])){
		y += move_speed;
	}

	//left
	if(keyboard_check(player.keybinds[2])){
		x -= move_speed;
	}

	//right
	if(keyboard_check(player.keybinds[3])){
		x += move_speed;
	}

	if(!Valid_move(self)){
		x = xx;
		y = yy;
	}
	
	//rotate up through other turrets if avaliable
	if(keyboard_check_pressed(player.keybinds[6])){
		var temp = selection;

		var cycling = true;
		while(cycling){
			selection++;
			if(selection == global.numOfCapturables){
				cycling = false;
				sprite_index = asset_get_index("s_Reticle");
			}
			else if(selection > global.numOfCapturables){
				selection = 0;	
			}
			
			if(selection == temp){
				cycling = false;
			}
			
			if(selection < global.numOfCapturables){
				var cap = player.list_capturables[selection];
				if(cap.enclosed == true){
					if( (cap.object_index != o_Castle) && (cap.recharging == false)){
						cycling = false;
					
						var name = "s_Reticle";
						if(cap.object_index == o_Volcano){
							name = "s_target_volcano";
						}
						else if(cap.object_index == o_Trebuchet){
							name = "s_target_mangonel";
						}
						else if(cap.object_index == o_LaserTurret){
							name = "s_target_laser"; 
						}
					
						sprite_index = asset_get_index(name);
					
					}
				}
			}
		}
		
	}
	
	//rotate down through other turrets if avaliable
	if(keyboard_check_pressed(player.keybinds[7])){
		var temp = selection;

		var cycling = true;
		while(cycling){
			selection--;
			if(selection < 0){
				cycling = false;
				selection = global.numOfCapturables;
				sprite_index = asset_get_index("s_Reticle");
			}
			
			if(selection == temp){
				cycling = false;
			}
			
			if(selection < global.numOfCapturables){
				var cap = player.list_capturables[selection];
				if(cap.enclosed == true){
					if( (cap.object_index != o_Castle) && (cap.recharging == false)){
						cycling = false;
					
						var name = "s_Reticle";
						if(cap.object_index == o_Volcano){
							name = "s_target_volcano";
						}
						else if(cap.object_index == o_Trebuchet){
							name = "s_target_mangonel";
						}
						else if(cap.object_index == o_LaserTurret){
							name = "s_target_laser"; 
						}
					
						sprite_index = asset_get_index(name);
					
					}
				}
			}
		}
		
		
	}


	//fire
	if(keyboard_check_pressed(player.keybinds[5])){
		
		var curTurret = noone;
		
		//cannon
		if(selection == global.numOfCapturables){
			var fired = false;
			for(var i = 0; (i < player.num_of_cannons) && (!fired); i++){
				var curCannon = player.list_cannons[i];
			
				//if the cannon is not killed or outside walls and not on cooldown
				if( (curCannon.enclosed) && (!curCannon.recharging) ){
					curTurret = curCannon;
					fired = true;
					
					//ball = instance_create_layer(curCannon.x, curCannon.y, "pieces", o_Ball)
					//ball.targetX = x;
					//ball.targetY = y;
					//ball.source = curCannon;
					//ball.fired = true;

					//curCannon.recharging = true;				
					//fired = true;
				}	
				
			}
		}
		else{
			var cap = player.list_capturables[selection];
			if( (cap.enclosed) && (!cap.recharging) ){
				//Note: Redundant, as it can't be selected anyway if these aren't met
				//but I guess having it doesn't hurt
				curTurret = cap;
			}
			
		}
		
		//fire projectile
		if(curTurret != noone){
			curTurret.recharging = true;
			
			if(curTurret.object_index == o_Trebuchet){
				//TODO: fire multiple projectiles at random intervals
				for(i = 0; i < 1; i++){
					var projectile = instance_create_layer(curTurret.x, curTurret.y, "pieces", curTurret.ammo);
					
					var xx, yy;
					
					xx = random_range(x-100,x+100);
					if(xx < 0){
						xx = 0;
					}
					else if (xx >= room_width){
						xx = (room_width - 1);
					}
					projectile.targetX = xx;
					
					yy = random_range(x-100,x+100);
					if(yy < 0){
						yy = 0;
					}
					else if (yy >= room_height){
						yy = (room_height - 1);
					}
					projectile.targetY = yy		
	
					projectile.source = curTurret;
					projectile.fired = true;
									
					//TODO: make it shoot in intervals
					/*
					for(var timer = room_speed*0.5*irandom(5); timer < 0; timer--){			
						//do nothing
					}
					*/

				}
			}//end trebuchet
			else{
				var projectile = instance_create_layer(curTurret.x, curTurret.y, "pieces", curTurret.ammo);
				projectile.targetX = x;
				projectile.targetY = y;
				projectile.source = curTurret;
				projectile.fired = true;

				if(curTurret.object_index == o_LaserTurret){
					projectile.image_angle = point_direction(curTurret.x,curTurret.y,x,y); 
				}
				
			}
				
			
		}//done firing

	}//done checking after fire button is pressed

}