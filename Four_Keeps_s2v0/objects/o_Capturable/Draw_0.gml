
if(player != noone){
	draw_sprite_ext(sprite_index, (player.num-1), x, y, 1, 1, image_angle, c_white, image_alpha);
}
else{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, image_alpha);
}