var food_count = 1000

// safety
if (!instance_exists(oHive)) exit;

// camera viewport (ONLY for guarantee, not distribution)
var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

for (var i = 0; i < food_count; i++)
{
    var fx, fy;

    var roll = random(1);

    // 20% guaranteed visible at start
    if (roll < 0.2)
    {
        fx = random_range(vx, vx + vw);
        fy = random_range(vy, vy + vh);
    }

    // 40% around hive (medium range)
    else if (roll < 0.6)
    {
        var dist = random_range(50000, 200); // IMPORTANT: minimum distance added
        var angle = random(360);

        fx = oHive.x + lengthdir_x(dist, angle);
        fy = oHive.y + lengthdir_y(dist, angle);
    }

    // 40% anywhere in the world
    else
    {
        fx = random(room_width);
        fy = random(room_height);
    }

    instance_create_layer(fx, fy, "Instances", oFood);
}