///@description Start game

//randomize the stuff
randomize();


global.tile_size = 32;
global.rounds = 5;
global.curRound = 1;
global.numberOfPlayers = 2;


global.phase = 0;
timer = 0; //rename to phaseTime?
gameTime = 0; //total time game is running. so good for if 10m limit


game_set_speed(60, gamespeed_fps);
global.gSpeed = game_get_speed(gamespeed_fps);

InitializePlayers();

clock = instance_create_layer(640, 400, "UI", o_Clock);
clock.visible = false;

alarm[0] = 1 * global.gSpeed;




 