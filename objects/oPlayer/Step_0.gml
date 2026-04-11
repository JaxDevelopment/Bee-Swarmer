var mx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var my = keyboard_check(ord("S")) - keyboard_check(ord("W"));



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