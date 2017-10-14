///@description server_send_loot
///@arg team
var 
team = argument0;

randomize();
var
dir = irandom_range(0,359),
rx = x + lengthdir_x(50, dir),
ry = y + lengthdir_y(50, dir);

with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_LOOT);
	buffer_write(send_buffer, buffer_u16, team);
	buffer_write(send_buffer, buffer_u16, rx);
	buffer_write(send_buffer, buffer_u16, ry);
}

with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}