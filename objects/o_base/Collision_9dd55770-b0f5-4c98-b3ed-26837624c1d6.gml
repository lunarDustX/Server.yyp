/// @description 

var bullet = other;
var xx,yy;

if (bullet.parent.team != team) {
	if (hp > 0) {
		hp--;
		//server_send_basehp(team, hp);
		if (hp mod 10 == 0 && soul > 0) {
			soul--;
			xx = (x + bullet.parent.x) div 2;
			yy = (y + bullet.parent.y) div 2;
			server_send_loot(team, xx, yy);
		}
	}
}


if (bullet.parent.team != team) {
	instance_destroy(bullet);
}
