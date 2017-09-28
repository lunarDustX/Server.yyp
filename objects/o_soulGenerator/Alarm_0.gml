/// @description 
for (i = 0; i< floor(soulNumber); i++) {
	server_send_soul();
}
soulNumber += 0.5;
// for 1v1v1
soulNumber = max(4, soulNumber);
alarm[0] = 35 * room_speed;