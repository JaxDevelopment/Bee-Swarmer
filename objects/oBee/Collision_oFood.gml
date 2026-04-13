
target_x = oHive.x
target_y = oHive.y
var spd = 5;

var dist = point_distance(x, y, target_x, target_y);

if (dist > spd)
{
    var dir = point_direction(x, y, target_x, target_y);

    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
}
else
{
    x = target_x;
    y = target_y;
}