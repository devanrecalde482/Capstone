///@description Game Over

show_message("Checking castle saftey");

//TODO: if we want to allow for multiple hp, we'll have to 
//reset only the correct player's side, and
//allow them to do phase 0 again

FloodAll();
CheckEnclosed();

var wallBreached = false;
with(o_Player){
	if(num_castles_enclosed < 0){
		global.playerHp[num-1]--;
		//hp--;
		wallBreached = true;
	}
	
}

if( (global.playerHp[0] <= 0) && (global.playerHp[1] <= 0 ) ){
	//draw or both players have 1 life and restart
	show_message("No one has a safe castle. Try again");
	global.playerHp[0] = 1;
	global.playerHp[1] = 1;
	//global.phase = 3;
	//alarm[3] = 1 * global.gSpeed;
		
}
else if(global.playerHp[0] <= 0){
	show_message("Player 2 wins!");
	room_goto(rm_main)
}
else if(global.playerHp[1] <= 0){
	show_message("Player 1 wins!");
	room_goto(rm_main)
}

if(wallBreached){
	room_restart();	
}
else{

	alarm[6] = 1 * global.gSpeed;	
}
