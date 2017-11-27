///@description server_send_kill
///@arg socket

var 
socket = argument0;


with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_KILL);
	buffer_write(send_buffer, buffer_u16, socket);
}

with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}