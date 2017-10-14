/// @description Insert description here
// You can write your code in this editor
var i_d = async_load[? "id"];
if (i_d == msg0) {
   if async_load[? "status"] {
      global.totalPlayer = ds_map_find_value(async_load, "value");
   }
}

if (i_d == msg1) {
   if async_load[? "status"] {
      global.minSoul = ds_map_find_value(async_load, "value");
   }
}
   
if (i_d == msg2) {
	if async_load[? "status"] {
		global.maxSoul = ds_map_find_value(async_load, "value");
    }
}

if (i_d == msg3) {
	if async_load[? "status"] {
		global.spd = ds_map_find_value(async_load, "value");
    }
}

if (i_d == msg4) {
	if async_load[? "status"] {
		global.interval = ds_map_find_value(async_load, "value");
		instance_create_layer(0,0,"Data", o_soulGenerator);
    }
}