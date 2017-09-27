/// @description 
if (other.parent = self) exit;
if (other.parent.team == self.team) exit;

instance_destroy(other);

hp--;
server_send_hurt(socket);

if (hp <= 0) {
	reset_player();
	server_send_die(socket);
}
