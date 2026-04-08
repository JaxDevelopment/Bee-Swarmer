var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
var my = keyboard_check(vk_down) - keyboard_check(vk_up);

var spd = 4;

// normalize WITHOUT point_distance (faster + smoother)
var len = sqrt(mx * mx + my * my);

if (len > 0)
{
    mx /= len;
    my /= len;
}

// move
x += mx * spd;
y += my * spd;