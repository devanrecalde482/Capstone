/// @description 


color = c_black;
keybinds = [];
enclosed = true;
cursor = noone;

list_castles = [];
starting_castle = 0;
num_castles_enclosed = 0;
territory = noone;

cannon = noone; //is this even used for anything?
list_cannons = [];
can_place_cannon = true;
num_of_cannons = 0;
saved_cannons = 1; //number of extra cannons available


piece = noone;
tPieces = ds_list_create();


move_snap(global.tile_size, global.tile_size);

