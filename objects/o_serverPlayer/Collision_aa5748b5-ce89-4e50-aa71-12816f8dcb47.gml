/// @description 
if (other.parent = self) exit;
if (other.parent.team == self.team) exit;

instance_destroy(other);
hp -= 1;

server_send_hurt(socket);
