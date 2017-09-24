///@description server_handle_message
///@arg socket
///@arg buffer
var 
socket = argument0,
buffer = argument1,
message_id = buffer_read(buffer, buffer_u8);

switch (message_id) {
	case MESSAGE_JOIN:
		var 
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16),
		username = buffer_read(buffer, buffer_string),
		
		playerNew = playerMap[? string(socket)];
		playerNew.name = username;
		playerNew.x = xx;
		playerNew.y = yy;
		
		// create new on existing clients
		buffer_seek(send_buffer, buffer_seek_start, 0);
		buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
		buffer_write(send_buffer, buffer_u16, socket);
		buffer_write(send_buffer, buffer_u16, xx);	
		buffer_write(send_buffer, buffer_u16, yy);
		buffer_write(send_buffer, buffer_string, username);
				
		with (o_serverPlayer) {
			if (self.socket != socket) {
				network_send_packet(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
				//show_message("create player" + string(socket) + " on " + string(self.socket));
			}
		}
		
		// create existing on new clients
		with (o_serverPlayer) {
			if (self.socket != socket) {
				buffer_seek(other.send_buffer, buffer_seek_start, 0);
				buffer_write(other.send_buffer, buffer_u8, MESSAGE_JOIN);
				buffer_write(other.send_buffer, buffer_u16, self.socket);
				buffer_write(other.send_buffer, buffer_u16, self.x);
				buffer_write(other.send_buffer, buffer_u16, self.y);
				buffer_write(other.send_buffer, buffer_string, self.name);

				network_send_packet(socket, other.send_buffer, buffer_tell(other.send_buffer));
				//show_message("create player" + string(self.socket) + " on " + string(socket));
			}
		}
		
		
	break;
	
	case MESSAGE_MOVE:
		var
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16),
		
		player = playerMap[? string(socket)];
		player.x = xx;
		player.y = yy;
		
		buffer_seek(send_buffer, buffer_seek_start, 0);
		buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
		buffer_write(send_buffer, buffer_u16, socket);
		buffer_write(send_buffer, buffer_u16, xx);
		buffer_write(send_buffer, buffer_u16, yy);
		
		with (o_serverPlayer) {
			if (self.socket != socket) {
				network_send_packet(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
			}
		}
	break;
	
	case MESSAGE_SHOOT:
		var
		dir = buffer_read(buffer, buffer_u16),
		playerShoot = playerMap[? string(socket)],
		bullet = instance_create_layer(playerShoot.x, playerShoot.y, "Data", o_bullet);
		bullet.dir = dir;
		bullet.parent = playerShoot;
		
		// send
		buffer_seek(send_buffer, buffer_seek_start, 0);
		buffer_write(send_buffer, buffer_u8, MESSAGE_SHOOT);
		buffer_write(send_buffer, buffer_u16, socket);
		buffer_write(send_buffer, buffer_u16, dir);
		
		with (o_serverPlayer) {
			if (socket != self.socket) {
				network_send_packet(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
			}
		}
	break;
}