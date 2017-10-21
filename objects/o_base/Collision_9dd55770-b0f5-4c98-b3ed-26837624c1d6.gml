/// @description 

var bullet = other;

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
