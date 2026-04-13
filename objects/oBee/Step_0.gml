// --- RESET SEPARATION ---
sep_x = 0;
sep_y = 0;


// --- CAMERA CULL (LIGHTWEIGHT) ---
var cam = view_camera[0];

var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

var margin = 200;

var active = !(x < vx - margin || x > vx + vw + margin ||
               y < vy - margin || y > vy + vh + margin);

// --- PICK NEW TARGET (ONLY WHEN ACTIVE) ---
if (active)
{
    var dx = target_x - x;
    var dy = target_y - y;

    if (dx*dx + dy*dy < 25 || random(100) < 2)
    {
        var angle = random(360);
        var dist = random_range(0, wander_range);

        if (instance_exists(hive)) {
            target_x = hive.x + lengthdir_x(dist, angle);
            target_y = hive.y + lengthdir_y(dist, angle);
        }
    }
}

// --- BASE DIRECTION ---
var dir = point_direction(x, y, target_x, target_y);

// --- SWARM SETTINGS ---
var neighbor_radius = 80;
var separation_radius = 20;

var align_strength = 0.05;
var cohesion_strength = 0.01;
var separation_strength = 0.15;

// --- SWARM CALC ---
var count = 0;
var avg_dir = 0;
var center_x = 0;
var center_y = 0;

var max_neighbors = 6;

// loop safely
with (oBee)
{
    if (id != other.id)
    {
        var dx = x - other.x;
        var dy = y - other.y;
        var dist_sq = dx*dx + dy*dy;

        if (dist_sq < neighbor_radius * neighbor_radius)
        {
            count++;

            avg_dir += direction;
            center_x += x;
            center_y += y;

            // separation (push away)
            if (dist_sq < separation_radius * separation_radius)
            {
                other.sep_x += (other.x - x);
                other.sep_y += (other.y - y);
            }

            if (count > max_neighbors) break;
        }
    }
}

// --- APPLY SWARM ---
if (count > 0)
{
    avg_dir /= count;
    center_x /= count;
    center_y /= count;

    // alignment
    dir = lerp(dir, avg_dir, align_strength);

    // cohesion
    var coh_dir = point_direction(x, y, center_x, center_y);
    dir = lerp(dir, coh_dir, cohesion_strength);

    // separation
    if (sep_x != 0 || sep_y != 0)
    {
        var sep_dir = point_direction(0, 0, sep_x, sep_y);
        dir = lerp(dir, sep_dir, separation_strength);
    }
}

// --- MOVE (ALWAYS RUN) ---
direction = dir;

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// --- SMOOTH ROTATION ---
image_angle = lerp(image_angle, direction, 0.2);
if (oHive.Score == 0)
{
	dead = 1
	instance_destroy()
}