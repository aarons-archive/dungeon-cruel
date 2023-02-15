function skeleton_movement() {
	
	// get movement input values
	var _horizontal_input = keyboard_check(_keyboard_right_key) - keyboard_check(_keyboard_left_key)
	var _vertical_input = keyboard_check(_keyboard_down_key) - keyboard_check(_keyboard_up_key)

    // calculate movement speed
	if (_horizontal_input != 0) {
		_horizontal_speed += _acceleration * _horizontal_input
		_horizontal_speed = clamp(_horizontal_speed, -_max_acceleration, _max_acceleration)
	} else {
		if (_horizontal_speed > _deceleration) {
			_horizontal_speed -= _deceleration
		} else if (_horizontal_speed < -_deceleration) {
			_horizontal_speed += _deceleration
		} else {
			_horizontal_speed = 0
		}
	}
	if (_vertical_input != 0) {
		_vertical_speed += _acceleration * _vertical_input
		_vertical_speed = clamp(_vertical_speed, -_max_acceleration, _max_acceleration)
	} else {
		if (_vertical_speed > _deceleration) {
			_vertical_speed -= _deceleration
		} else if (_vertical_speed < -_deceleration) {
			_vertical_speed += _deceleration
		} else {
			_vertical_speed = 0
		}
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
}

function skeleton_animation() {

	if (_horizontal_speed != 0 or _vertical_speed != 0) {
		sprite_index = sSkeletonWalk;
	} else {
		sprite_index = sSkeletonIdle;
	}
}

function move_crossbow() {
	
	_crossbow_direction = point_direction(x, y, mouse_x, mouse_y)
	_crossbow.image_angle = _crossbow_direction
	
	if (_crossbow.image_angle < 180) {
		_facing = -1
	} else if (_crossbow.image_angle > 180) {
	    _facing = 1
	}
	
	_crossbow.depth = depth + (_crossbow_direction > 0 && _crossbow_direction < 180)

	_crossbow.x = x + lengthdir_x(_crossbow_distance, _crossbow_direction)
	_crossbow.y = y + lengthdir_y(_crossbow_distance, _crossbow_direction)

	_crossbow_distance = lerp(_crossbow_distance, 11, 0.1)
}

function fire_crossbow() {
	
	if (mouse_check_button(_keyboard_fire_key) and _crossbow_can_fire) {
		
		// pullback effect for cross bow
		_crossbow_distance = 5
			
		// reset cooldown
		_crossbow_can_fire = false
		alarm_set(1, _crossbow_cooldown_timer)
		
		// calulcate direction
		var _dir = point_direction(x, y, mouse_x, mouse_y)
		
		with(instance_create_layer(x, y, "Arrows", oArrow)) {
			speed = other.bullet_speed
			direction = _dir
			image_angle = _dir
		}
	}
}

function grapple_crossbow() {
	
	if (mouse_check_button(_keyboard_grapple_key) and _crossbow_can_fire and not instance_exists(oGrappleA)) {
		
		// pullback effect for cross bow
		_crossbow_distance = 5
		
		// reset cooldown
		_crossbow_can_fire = false
		alarm_set(1, _crossbow_cooldown_timer)
		
		// calculate direction
		var _dir = point_direction(x, y, mouse_x, mouse_y)
			
		// create grapple arrow
		instance_create_layer(x, y, "Arrows", oGrappleA)
		with(oGrappleA) {
			speed = other.bullet_speed
			direction = _dir
			image_angle = _dir 
		}
	}
	
	if instance_exists(oGrappleA) {
		if place_meeting(oGrappleA.x, oGrappleA.y, oGrapplePoint) {
			oGrappleA.speed = 0
			move_towards_point(oGrappleA.x, oGrappleA.y, 5)
			if place_meeting(x, y, oGrapplePoint) {
				oGrappleA.bulletDie()
				speed = 0
			}
		}
	}
}