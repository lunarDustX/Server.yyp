/// @description Insert 
if (!start_match) {
	if (global.readyNum > 0 && global.readyNum == ds_map_size(o_server.playerMap)) {
		start_match = true;
		server_send_startgame();
		alarm[0] = 3 * room_speed;
	}
}
