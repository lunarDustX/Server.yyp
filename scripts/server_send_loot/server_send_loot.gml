///@description server_send_loot
///@arg team
///@arg x
///@arg y
var 
team = argument0,
xx = argument1,
yy = argument2;

/*
randomize();
var
dir = irandom_range(0,359),
rx = x + lengthdir_x(BASE_LOOT_RANGE, dir),
ry = y + lengthdir_y(BASE_LOOT_RANGE, dir);
*/

with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_LOOT);
	buffer_write(send_buffer, buffer_u16, team);
	buffer_write(send_buffer, buffer_u16, xx);
	buffer_write(send_buffer, buffer_u16, yy);
}

with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}