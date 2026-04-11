randomize();
// total food in the world
var food_count = 3000; // start small

for (var i = 0; i < food_count; i++)
{
    var fx = random(room_width);
    var fy = random(room_height);

    instance_create_layer(fx, fy, "Instances", oFood);
}