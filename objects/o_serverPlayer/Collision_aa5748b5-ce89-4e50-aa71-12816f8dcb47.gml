/// @description 
// same team bullet
if (other.parent = self) exit;
if (other.parent.team == self.team) exit;
if (hp <= 0) exit;
//

instance_destroy(other);
hp--;
server_send_hurt(socket, 1);

if (hp <= 0) {
	reset_player();
	server_send_die(socket);
	other.parent.hp = clamp(other.parent.hp+2, 0, MAXHP);
	server_send_hurt(other.parent.socket, -2);
}
