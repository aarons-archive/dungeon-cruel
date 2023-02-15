function detect_gamepad() {
	for (var i = 0; i < gamepad_get_device_count(); i++;) {
		if (gamepad_is_connected(i)) { 
			_gamepad_slot = i 
			gamepad_set_axis_deadzone(_gamepad_slot, _gamepad_analogue_deadzone)
			break
		}
	}
}
 
function knight_movement() {
	
	// get movement input values
	var _move_horizontal_input = sign(gamepad_axis_value(_gamepad_slot, _horizontal_move_stick))
	var _move_vertical_input = sign(gamepad_axis_value(_gamepad_slot, _vertical_move_stick))
	
	// calculate movement speed
	if (_move_horizontal_input != 0 || _move_vertical_input != 0) {
		var _direction = point_direction(0, 0, _move_horizontal_input, _move_vertical_input)
		_horizontal_speed = lengthdir_x(_speed, _direction)
		_vertical_speed = lengthdir_y(_speed, _direction)
	}

	// check for collisions
	if (place_meeting(x + _horizontal_speed, y, oSolid)) {
		while (not place_meeting(x + sign(_horizontal_speed), y, oSolid)) {
			x += sign(_horizontal_speed)
		}
		_horizontal_speed = 0
	}
	if (place_meeting(x, y + _vertical_speed, oSolid)) {
		while (not place_meeting(x, y + sign(_vertical_speed), oSolid)) {
			y += sign(_vertical_speed)
		}
		_vertical_speed = 0
	}
	
	// actually move player
	x += _horizontal_speed
	y += _vertical_speed
	
	// apply some kinda of friction??
	_horizontal_speed *= _deceleration
	_vertical_speed *= _deceleration
}

function knight_animation() {
	if (_horizontal_speed != 0 or _vertical_speed != 0) {
		sprite_index = sKnightWalk;
	} else {
		sprite_index = sKnightIdle;
	}
}

function hammer_movement() {
	
	// get rotation input values
	var _hammer_horizontal_input = gamepad_axis_value(_gamepad_slot, _horizontal_hammer_stick)
	var _hammer_vertical_input = gamepad_axis_value(_gamepad_slot, _vertical_hammer_stick)
	
	// hammer rotation
	var _hammer_direction = point_direction(0, 0, _hammer_horizontal_input, _hammer_vertical_input)
	
	if (_hammer_horizontal_input == 0 and _hammer_vertical_input == 0) { 
		_hammer.image_angle = 315 // idle position
	} 
	else { 
		_hammer.image_angle = _hammer_direction - 90
		if (_hammer.image_angle < 0) {
			_hammer.image_angle += 360
		}
	}
	
	// rotate player
	if (_hammer.image_angle < 180) {
		_facing = -1
	} else if (_hammer.image_angle > 180) {
	    _facing = 1
	}

    // hammer movement
	_hammer.x = x + lengthdir_x(_hammer_distance, _hammer_direction)
	_hammer.y = y - _hammer_distance
}

function hit_hammer() {
	
	if (gamepad_button_check(_gamepad_slot, _hammer_hit_button) and _hammer_can_hit) {
			
		// reset cooldown
		_hammer_can_hit = false
		alarm_set(0, _hammer_cooldown_timer)
		
		_hammer_angle = -90
	}
	_hammer_angle = lerp(0, _hammer_angle, 0.9)
	_hammer.image_angle += _hammer_angle
}

function push() {
	if (gamepad_button_check(_gamepad_slot, gp_face3)) {
		var collis_Right = collision_line(x, y, x + 10, y, oBox, 0, 0);
		if (collis_Right != noone) { collis_Right.direction = 0; collis_Right.speed = collis_Right.pushSpeed; collis_Right.state = "move";}
		
		var collis_Left = collision_line(x, y, x-10, y, oBox, 0, 0);
		if (collis_Left != noone) { collis_Left.direction = 180; collis_Left.speed = collis_Left.pushSpeed; collis_Left.state = "move";}
		
		var collis_Top = collision_line(x, y, x, y - 10, oBox, 0, 0);
		if (collis_Top != noone) { collis_Top.direction = 90; collis_Top.speed = collis_Top.pushSpeed; collis_Top.state = "move";}
		
		var collis_Bottom = collision_line(x, y, x, y + 10, oBox, 0, 0);
		if (collis_Bottom != noone) { collis_Bottom.direction = 270; collis_Bottom.speed = collis_Bottom.pushSpeed; collis_Bottom.state = "move";}
	}
}