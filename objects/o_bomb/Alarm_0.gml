/// @description explode
instance_destroy();
instance_create_layer(x, y, "Instances", o_explosion);
with (o_serverPlayer) {
	if (self.team != other.parent.team) {
		if (point_distance(x, y, other.x, other.y) < 85) {
			//hurt
			hp = clamp(hp-3, 0, MAXHP);
			server_send_hurt(socket, 3);

			if (hp <= 0) {
				reset_player();
				server_send_die(socket);
				other.parent.hp = clamp(other.parent.hp+2, 0, MAXHP);
				server_send_hurt(other.parent.socket, -2);
			}
		}
	}
}

with (o_base) {
	if (self.team != other.parent.team) {
		if (point_distance(x, y, other.x, other.y) < 105) {
			if (self.soul > 0) {
				self.soul--;
				global.tempSoul++;
				server_send_decrease(self.team);
			}
		}
	}
}