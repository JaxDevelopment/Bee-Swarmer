// --- MOVEMENT ---
spd = random_range(1, 2);
direction = random(360);
image_angle = direction;

// --- WANDER ---
wander_range = 100;
target_x = x;
target_y = y;

// --- HIVE ---
if (instance_exists(oHive)) {
    hive = instance_find(oHive, 0);
}

// --- SWARM ---
sep_x = 0;
sep_y = 0;
dead = 0
// current food target
target_food = noone;

// how far bees can detect food
food_range = 150;