/// @description check whent game starts
if (!start_match) {
	if (global.readyNum == global.totalPlayer) {
		start_match = true;
		alarm[11] = room_speed;
	}
}
