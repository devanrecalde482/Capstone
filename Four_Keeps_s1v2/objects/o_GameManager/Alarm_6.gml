/// @description Clean up
//this is to allow a pause between phases, and to disable various variables

FloodAll();
CheckCastles();
		
//FIXME: This section has overlap, and needs cleaning up
switch(global.phase){
	case 0: {
		with(o_Player){
			
			if(cursor!= noone){
				Set_Start_Castle(cursor);
			}
			cursor = noone;
			can_move = false;
		}
	}
	break;
	
	case 1: {

		with(o_Player){
			if( cursor!= noone){
				instance_destroy( cursor );
				cursor = noone;
			}
		}

	}
	break;
	
	case 2: {

		with(o_Player){
			if(cursor != noone){
				instance_destroy( cursor );
				cursor = noone;
			}
		}
				
	}
	break;
	
	case 3: {
		with(o_Player){	
			if(piece != noone){
				instance_destroy(piece);
				piece = noone;
			}
			if(num_castles_enclosed <= 0){
				hp--;	
			}
			
		}
	}
	break;
	
	case 4: {
		global.phase = 0; 
		global.curRound++;
	}
	break;
	
	default: break;
	
}

//move to next phase
global.phase++;

//how long you want to wait between each phase
var phaseDelay = 1;
alarm[global.phase] = phaseDelay * global.gSpeed;

//alarm[5] = 1;