/// @description Fire cannons

show_message("Shoot your enemy's walls");
player1.cursor = instance_create_layer(player1.startX, player1.startY, "UI", o_BlueReticle);
player2.cursor = instance_create_layer(player2.startX, player2.startY, "UI", o_RedReticle);

with(o_Player){
	can_move = true;
	cursor.player = self;
	cursor.can_move = true;
}

SetTimer();