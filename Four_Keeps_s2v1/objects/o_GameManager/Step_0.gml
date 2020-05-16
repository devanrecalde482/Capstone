/// @description Timer

//this bit may not really be different from what is used
//gameTime += (delta_time*0.0000001) * game_get_speed(gamespeed_fps);

//gameTime += 1/global.gSpeed;

if(timerOn){
	if(phaseTime > 0){
		phaseTime -= 1/global.gSpeed;
		clock.image_index = floor(phaseTime);
	
		if(global.phase == 0){
			with(global.mainID){
				if( (list_players[0].num_castles_enclosed > 0) && (list_players[1].num_castles_enclosed > 0) ){
					other.phaseTime = 0;
				}
			}
		}
	
		//TODO: check to see if there are any areas that a cannon can be placed
		//else, can_place_cannon = false
		else if(global.phase == 1){
			var moreCannons = false;
			with(o_Player){
				if(saved_cannons > 0){
					moreCannons = true;	
				}
			}
			if( !moreCannons){
				phaseTime = 0;
			}
		}
		
		//HACK: FIXME: this is a quick fix for infinite cannon firing
		if(phaseTime <= 0){
			with(o_Player){
				can_move = false;
			}
		}
		
	}
	else if( (instance_number(o_Ball) > 0) || (instance_number(o_Rock) > 0) || (instance_number(o_Fireball) > 0) ){
		//wait

	}
	else{		
		
		timerOn = false;
		clock.visible = false;
		alarm[6] = 1;
	}
}
	
