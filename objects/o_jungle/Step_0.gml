/// @description view
if (!instance_exists(o_player)) exit;
var dist = point_distance(x, y, o_player.x, o_player.y);
if (dist < (sprite_width div 2 + 16)) {
	image_index = 1;
} else {
	image_index = 0;
}
