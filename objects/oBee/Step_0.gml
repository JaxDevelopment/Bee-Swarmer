
// get camera
var cam = view_camera[0];

// camera bounds
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

// margin so things don’t pop in/out instantly
var margin = 200;

// check if outside view
if (x < vx - margin || x > vx + vw + margin ||
    y < vy - margin || y > vy + vh + margin)
{
    exit; // STOP running logic
}
// ensure hive exists
if (!instance_exists(hive))
{
    hive = instance_find(oHive, 0);
    exit;
}

// pick new target if reached or randomly
if (point_distance(x, y, target_x, target_y) < 5 || random(100) < 2)
{
    var angle = random(360);
    var dist = random_range(0, wander_range);

    target_x = hive.x + lengthdir_x(dist, angle);
    target_y = hive.y + lengthdir_y(dist, angle);
}

// move toward target
var dir = point_direction(x, y, target_x, target_y);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);