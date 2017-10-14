///@description server_handle_connect
///@arg socket
var socket = argument0;

buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_GETID);
buffer_write(send_buffer, buffer_u16, socket);
network_send_packet(socket, send_buffer, buffer_tell(send_buffer));

/*
randomize();
var spawn_x = irandom_range(200, 400),
	spawn_y = irandom_range(200, 400);
*/	
var player = instance_create_layer(0, 0, "Data", o_serverPlayer);
player.socket = socket;
playerMap[? string(socket)] = player;



