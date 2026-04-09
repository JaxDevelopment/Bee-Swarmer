if (mouse_check_button_pressed(mb_left))
{
    with (oBee)
    {
        if (selected)
        {
            target_x = mouse_x;
            target_y = mouse_y;
            manual = true;
        }
    }
}