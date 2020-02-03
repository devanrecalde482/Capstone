///@function GetTile(tilelayer,tile,x,y)
///@description start flood filling from tile spot x/y
///@param map the name of the maplayer of the tilemap
///@param tile the tile to be set to
///@param x
///@param y

var tm = argument0;
var tt = argument1;
var tx = argument2;
var ty = argument3;

//check if tm is valid?
tilemap_set(layer_tilemap_get_id(layer_get_id(tm)), tt, tx, ty);