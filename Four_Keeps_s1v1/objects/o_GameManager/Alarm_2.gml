/// @description Fire cannons

show_message("Shoot your enemy's walls");

with(o_Player){
	cursor = instance_create_layer(startX, startY, "UI", o_Reticle);

	can_move = true;
	cursor.player = self;
	
	cursor.can_move = true;
}

SetTimer();