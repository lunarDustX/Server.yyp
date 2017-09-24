/// @description 
if (other.parent = self) exit;

instance_destroy(other);
hp -= 1;

server_send_hurt(socket);
