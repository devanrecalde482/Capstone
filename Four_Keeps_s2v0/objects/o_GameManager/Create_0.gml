///@description Start game

//randomize the stuff
randomize();

global.tile_size = 32;
global.rounds = 5;
global.curRound = 1;
global.numberOfPlayers = 2;
global.castles = 2;
global.numOfCapturables = 5;

global.phase = 0;
phaseTime = 0;
//currently 10/10/15/20 seems to be best?
timers = [10, 10, 15, 25, 0, 0, 0, 0]; 
//gameTime = 0; //total time game is running. so good for if 10m limit

game_set_speed(60, gamespeed_fps);
global.gSpeed = game_get_speed(gamespeed_fps);


set_piece_list();

global.map_width = room_width / global.tile_size;
global.map_height = room_height / global.tile_size;

InitializeMap();
InitializePlayers(global.numberOfPlayers);

clock = instance_create_layer(room_width/2, room_height/2, "UI", o_Clock);
clock.visible = false;

FloodAll();

alarm[0] = 1 * global.gSpeed;







 