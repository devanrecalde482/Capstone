
move_snap(global.tile_size, global.tile_size);
x += adjustX;
y += adjustY;

image_speed = 2;


//Note: changed from my.sprite_index; should be the same
sprite_collision_mask(sprite_index, true, 1, 0, 0, 0, 0, 0, 0);

//HACK
if(player != noone){
	pColor = player.color;	
}






