/// @description Choose Castle

show_message("Choose your castle.");

player1.cursor = instance_create_layer(player1.startX, player1.startY, "UI", o_BlueChoose);
player2.cursor = instance_create_layer(player2.startX, player2.startY, "UI", o_RedChoose);

with(o_Player){
	cursor.player = self;
	can_move = true;
	cursor.can_move = true;
	move_snap(32, 32);
}

SetTimer();




