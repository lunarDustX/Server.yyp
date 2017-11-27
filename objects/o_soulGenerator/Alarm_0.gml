/// @description spawn souls
/*
for (i = 0; i< floor(soulNumber); i++) {
	server_send_soul();
}

soulNumber += global.spd;


// for 2v2v2
soulNumber = min(global.maxSoul, soulNumber);
alarm[0] = global.interval * room_speed;
*/

for (i = 0; i < floor(soulNumber + global.tempSoul); i++) {
	server_send_soul();	
}
global.tempSoul = 0;
alarm[0] = global.interval * room_speed;