var xx, yy;
var successPos = false;
while (successPos == false) {
	successPos = true;
	xx = irandom_range(CENTER_X - SPAWN_RADIUS, CENTER_X + SPAWN_RADIUS);
	yy = irandom_range(CENTER_Y - SPAWN_RADIUS, CENTER_Y + SPAWN_RADIUS);
	with (o_hex_grey) {
		if (point_distance(self.x, self.y, xx, yy) < 50) {
			successPos = false;	
		}
	}
}

with (o_server) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_SPAWN);
	buffer_write(send_buffer, buffer_u16, xx);
	buffer_write(send_buffer, buffer_u16, yy);
}
	
with (o_serverPlayer) {
	network_send_packet(self.socket, o_server.send_buffer, buffer_tell(o_server.send_buffer));
}