/// @description 
draw_self();
draw_healthbar(x-16, y-20, x+16, y-18, hp*(100/MAXHP), c_white, c_red, c_green, 0, false, false);
draw_text(x-16, y-35, name);

draw_text(x, y, spawnx);
//draw_text(x, y, string(soul));

