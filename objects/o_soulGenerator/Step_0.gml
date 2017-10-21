/// @description check whent game starts
if (!start_match) {
	if (global.readyNum == global.totalPlayer) {
		start_match = true;
		server_send_startgame();
		alarm[0] = 3 * room_speed;
	}
}
