/// @description Check for clients and data
switch (async_load[?"type"]) {
	case network_type_connect:
		var socket = async_load[? "socket"];
		server_handle_connect(socket);
	break;
	
	case network_type_disconnect:
		var socket = async_load[? "socket"];
		server_handle_disconnect(socket);
	break;
	
	case network_type_data:
		var socket = async_load[? "id"];
		var buffer = async_load[? "buffer"];
		server_handle_message(socket, buffer);
	break;  
}
