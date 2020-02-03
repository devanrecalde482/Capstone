///@function GetTile(tilelayer,x,y)
///@param map the name of the maplayer of the tilemap
///@param x
///@param y

var tm = argument0;
var tx = argument1;
var ty = argument2;

//check if tm is valid?
return tilemap_get(layer_tilemap_get_id(layer_get_id(tm)), tx, ty);
