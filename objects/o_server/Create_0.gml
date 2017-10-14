/// @description 
var type = network_socket_tcp,
	port = 9000,
	maxClients = 20;

server = network_create_server(type, port, maxClients);
if (server < 0) {
	show_error("Could not create server!", true);
}

//socket_list = ds_list_create();
playerMap = ds_map_create();
send_buffer = buffer_create(256, buffer_fixed, 1);

global.readyNum = 0;
