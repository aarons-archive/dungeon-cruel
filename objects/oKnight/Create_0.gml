event_inherited()

// gamepad
_gamepad_slot = -1
_gamepad_analogue_deadzone = 0.1
_horizontal_move_stick = gp_axislh
_vertical_move_stick = gp_axislv
_horizontal_hammer_stick = gp_axisrh
_vertical_hammer_stick = gp_axisrv
_hammer_hit_button = gp_shoulderr


// movement
_horizontal_speed = 0
_vertical_speed = 0
_speed = 3
_deceleration = 0.5


//skele health
hpCurrentKnight = global.hpMaxKnight;
hpMinKnight = 0;
hpNextKnight = hpCurrentKnight;


// hammer
_hammer = instance_create_layer(x, y, "Instances", oHammer)
_hammer_distance = 5
_hammer.depth = depth + 1
_hammer_can_hit = true
_hammer_cooldown_timer = room_speed * 0.5
_hammer_angle = -90