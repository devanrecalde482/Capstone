//@description create the players

var num_players = 2;
var int p = 0;

//Player 1
if(p < num_players){
	list_players[0] = instance_create_layer(x, y, "Instances", o_Player);
	
	list_players[0].num = 1;
	list_players[0].color = c_red;
	list_players[0].hp = global.playerHp[0];
	list_players[0].keybinds = [ord("W"), ord("S"), ord("A"), ord("D"), ord("R"), ord("T"),ord("Q"),ord("E")];
	
	p++;
}

//Player 2
if(p < num_players){
	list_players[1] = instance_create_layer(x, y, "Instances", o_Player);
	
	list_players[1].num = 2;
	list_players[1].color = c_blue;
	list_players[1].hp = global.playerHp[1];
	list_players[1].keybinds = [vk_up, vk_down, vk_left, vk_right, vk_rshift, vk_enter,vk_numpad1,vk_numpad2];

	p++;
}

