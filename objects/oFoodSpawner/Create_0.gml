
// how far apart spawn zones are
var spacing = 300;

// loop across the entire room
for (var xx = 0; xx < room_width; xx += spacing)
{
    for (var yy = 0; yy < room_height; yy += spacing)
    {
        // random position inside each grid cell
        var fx = xx + random(spacing);
        var fy = yy + random(spacing);

        // make sure it's inside the room bounds
        fx = clamp(fx, 0, room_width);
        fy = clamp(fy, 0, room_height);

        // chance to spawn (prevents overpopulation)
        if (random(1) < 0.8)
        {
            instance_create_layer(fx, fy, "Instances", oFood);
        }
    }
}