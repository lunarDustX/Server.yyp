///@description server_send_hurt
///@arg socket
///@arg damage
//show_message("send hurt");

var 
socket = argument0,
damage = argument1;

with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_HIT);
	buffer_write(send_buffer, buffer_u16, socket);
	buffer_write(send_buffer, buffer_s16, damage);
}

with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}