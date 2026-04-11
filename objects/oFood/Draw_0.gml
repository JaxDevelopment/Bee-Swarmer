
var cam = view_camera[0];

var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

if (x < vx || x > vx + vw || y < vy || y > vy + vh)
{
    exit;
}


draw_self();

draw_set_halign(fa_center);
draw_text(x, y - 20, string(health1));
draw_set_halign(fa_left);