/// @description Insert 
if (!start_match) {
	if (global.readyNum > 0 && global.readyNum == ds_map_size(o_server.playerMap)) {
		start_match = true;
		show_message("Game Start!");
		alarm[0] = 3 * room_speed;
	}
}