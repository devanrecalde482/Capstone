///@description Choose Castle

show_message("Choose your castle.");

with(o_Player){
	cursor = instance_create_layer(x+32, y+32, "UI", o_Choose);
	cursor.player = self;
	can_move = true;
	cursor.can_move = true;
}

SetTimer();





