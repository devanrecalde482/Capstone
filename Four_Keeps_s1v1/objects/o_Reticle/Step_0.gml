///@description Movement

var xx = x;
var yy = y;

if(can_move){ 
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

		//fire
		if(keyboard_check_pressed(player.keybinds[5])){
			var fired = false;
			for(var i = 0; (i < player.num_of_cannons) && (!fired); i++){
				var curCannon = player.list_cannons[i];
			
				if(curCannon == noone){
					//error
				}
				else if((curCannon.enabled) && (!curCannon.cooldown) ){
					ball = instance_create_layer(curCannon.x, curCannon.y, "UI", o_Ball)
					ball.targetX = x;
					ball.targetY = y;
					ball.source = curCannon;
					ball.fired = true;

					curCannon.cooldown = true;				
					fired = true;
				}	
			}
		}

	}
} 











