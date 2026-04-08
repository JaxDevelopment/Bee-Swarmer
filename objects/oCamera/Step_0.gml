
// target = player center
var tx = oPlayer.x;
var ty = oPlayer.y;

// get camera
var cam = view_camera[0];

// current camera position
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);

// smooth follow (IMPORTANT PART)
var follow_speed = 0.15;

cx = lerp(cx, tx - camera_get_view_width(cam) * 0.5, follow_speed);
cy = lerp(cy, ty - camera_get_view_height(cam) * 0.5, follow_speed);

// apply
camera_set_view_pos(cam, cx, cy);