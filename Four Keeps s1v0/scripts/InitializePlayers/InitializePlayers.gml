//@description create the players

player1 = instance_create_layer(x, y, "UI", o_Player);
player2 = instance_create_layer(x, y, "UI", o_Player);

player1.keybinds = [vk_up, vk_down, vk_left, vk_right, vk_rshift, vk_enter];
player2.keybinds = [ord("W"), ord("S"), ord("A"), ord("D"), ord("R"), ord("T")];

player1.color = c_blue;
player2.color = c_red;

player1.list_castles = [
	P1_Castle1,
	P1_Castle2,
	P1_Castle3,
	P1_Castle4,
];
player2.list_castles = [
	P2_Castle1,
	P2_Castle2,
	P2_Castle3,
	P2_Castle4,
];

with(o_Player){
	for(var i = 0; i < 4; i++){
		list_castles[i].player = self;	
	}
}

player1.startX = P1_Castle1.x;
player1.startY = P1_Castle1.y;
player2.startX = P2_Castle1.x;
player2.startY = P2_Castle1.y;

player1.cannon = o_BlueCannon;
player2.cannon = o_RedCannon;

ds_list_add(player1.tPieces, oBlueSingle, oBlueDouble, oBlueTriple, oBlueCorner, 
oBlueT, oBlueS, oBlueZ, oBlueL, oBlueJ, oBlueI, oBlueO);


ds_list_add(player2.tPieces, oRedSingle, oRedDouble, oRedTriple, oRedCorner, 
oRedT, oRedS, oRedZ, oRedL, oRedJ, oRedI, oRedO);












