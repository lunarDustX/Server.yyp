/// @description 

var bullet = other;
/*
if (bullet.parent == o_player) {
	if (team != o_player.team) {
		if (hp > 0) {
			hp--;
			client_send_base_hp(team, hp);
			if (hp mod 10 == 0) {
			
			}
		}
	}
}
*/
if (bullet.parent.team != team) {
	if (hp > 0) {
		hp--;
		//server_send_basehp(team, hp);
		if (hp mod 10 == 0 && soul > 0) {
			soul--;
			server_send_loot(team);
		}
	}
}


if (bullet.parent.team != team) {
	instance_destroy(bullet);
}
