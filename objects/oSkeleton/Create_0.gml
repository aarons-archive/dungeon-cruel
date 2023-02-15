event_inherited();

// keyboard
_keyboard_up_key = ord("W")
_keyboard_left_key = ord("A")
_keyboard_down_key = ord("S")
_keyboard_right_key = ord("D")
_keyboard_fire_key = mb_left
_keyboard_grapple_key = mb_right


// movement 
_horizontal_speed = 0
_vertical_speed = 0
_acceleration = 0.2
_max_acceleration = 3
_deceleration = _acceleration / 0.5

//health
//skele health
hpCurrentSkele = global.hpMaxSkele;
hpMinSkele = 0;
hpNextSkele = hpCurrentSkele;

// crossbow
_crossbow = instance_create_layer(x, y, "Instances", oCrossbow)
_crossbow_direction = 0
_crossbow_can_fire = true
_crossbow_cooldown_timer = room_speed * 0.5
_crossbow_distance = 11
_crossbow_grapple = 0

bullet_speed = 8


// other 
is_dashing = false
dash_speed = _max_acceleration * 2
dash_counter = 0

rotation = image_angle