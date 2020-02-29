

//HACK: crashes sometimes because player not always set?
if(player != noone){
	pColor = player.color;	
}


draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, pColor, 1);