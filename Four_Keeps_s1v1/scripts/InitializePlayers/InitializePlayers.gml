//@description create the players

var num_players = 2;
var int p = 0;

if(p < num_players){

	//player 1
	
	player1 = instance_create_layer(x, y, "UI", o_Player);
	player1.num = 1;
	player1.color = c_blue;
	player1.keybinds = [vk_up, vk_down, vk_left, vk_right, vk_rshift, vk_enter];

	player1.list_castles = [
		P1_Castle1,
		P1_Castle2,
		P1_Castle3,
		P1_Castle4,
	];

	player1.startX = P1_Castle1.x;
	player1.startY = P1_Castle1.y;
	
	p++;
}


if(p < num_players){
	
	//Player 2
	
	player2 = instance_create_layer(x, y, "UI", o_Player);
	player2.num = 2;
	player2.color = c_red;
	player2.keybinds = [ord("W"), ord("S"), ord("A"), ord("D"), ord("R"), ord("T")];

	player2.list_castles = [
		P2_Castle1,
		P2_Castle2,
		P2_Castle3,
		P2_Castle4,
	];

	player2.startX = P2_Castle1.x;
	player2.startY = P2_Castle1.y;

	p++;

}


with(o_Player){
	for(var i = 0; i < 4; i++){
		list_castles[i].player = self;	
	}
}








