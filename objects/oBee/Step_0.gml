
// --- (5) Only simulate bees near player ---
if (point_distance(x, y, oPlayer.x, oPlayer.y) > 2000) exit;


// --- ALWAYS move (no skipping = no jitter) ---
var dir = point_direction(x, y, target_x, target_y);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);


// --- (6) Only update "thinking" sometimes ---
if (update_group == (current_time mod 3))
{
    // --- (4) Reduced expensive logic ---
    if (random(1) < 0.02)
    {
        var angle = random(360);
        var dist = random(range);

        target_x = oHive.x + lengthdir_x(dist, angle);
        target_y = oHive.y + lengthdir_y(dist, angle);
    }
}