var 
xx = irandom_range(room_width/2-100, room_width/2+100),
yy = irandom_range(room_height/2-100, room_height/2+100);
with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_SPAWN);
	buffer_write(send_buffer, buffer_u16, xx);
	buffer_write(send_buffer, buffer_u16, yy);
}
	
with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}