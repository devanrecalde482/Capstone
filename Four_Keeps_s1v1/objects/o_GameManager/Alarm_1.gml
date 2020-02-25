/// @description Place cannons

show_message("Place your cannons");

player1.cursor = instance_create_layer(player1.startX, player1.startY, "UI", o_BlueCannon);
player2.cursor = instance_create_layer(player2.startX, player2.startY, "UI", o_RedCannon);

with(o_Player){
	can_move = true;
	cursor.player = self;
	cursor.can_move = true;
	saved_cannons += (num_castles_enclosed + 1);
	can_place_cannon = true;
	move_snap(32, 32);
	//show_message("I can place: " + string( saved_cannons));
}

SetTimer();


