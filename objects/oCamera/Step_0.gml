

// get camera
var cam = view_camera[0];

// camera size
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

// target (center on player)
var target_x = oPlayer.x - vw * 0.5;
var target_y = oPlayer.y - vh * 0.5;

// current position
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);

// --- SMOOTH FOLLOW WITH NATURAL SLOWDOWN ---
var smooth = 0.12;

// move toward target (this naturally slows near destination)
cx += (target_x - cx) * smooth;
cy += (target_y - cy) * smooth;

// apply
camera_set_view_pos(cam, cx, cy);