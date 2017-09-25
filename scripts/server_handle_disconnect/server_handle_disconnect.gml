///@description server_handle_disconnect
///@arg socket
var 
socket = argument0;

//var pos = ds_list_find_index(socket_list, socket);
//ds_list_delete(socket_list, pos);
var playerLeft = playerMap[? string(socket)];
with (playerLeft) {
	instance_destroy();
}
ds_map_delete(playerMap, string(socket));

buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_LEAVE);
buffer_write(send_buffer, buffer_u16, socket);

with (o_serverPlayer) {
	network_send_packet(self.socket, other.send_buffer, buffer_tell(other.send_buffer));
}

global.readyNum--;