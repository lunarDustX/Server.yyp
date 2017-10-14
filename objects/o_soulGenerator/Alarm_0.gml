/// @description 
for (i = 0; i< floor(soulNumber); i++) {
	server_send_soul();
}
//soulNumber += 0.5;
soulNumber += global.spd;


// for 1v1v1
soulNumber = min(global.maxSoul, soulNumber);
alarm[0] = global.interval * room_speed;