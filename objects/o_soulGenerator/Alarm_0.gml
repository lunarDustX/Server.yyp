/// @description 
for (i = 0; i< floor(soulNumber); i++) {
	server_send_soul();
}
soulNumber += 0.5;
alarm[0] = 20 * room_speed;