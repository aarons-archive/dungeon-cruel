players = choose(PLAYERS);

if(target == noone)
{
	target = instance_find(players, 0);
	
	return;
}

//FACING DIR
if(x > posNx)
{
	image_xscale = -1;
} else if(x < posNx) {
	image_xscale = 1;
}

//lerp shit
	if(state != STATES.death)
	{
		x = lerp(x, posNx, 0.02);
		y = lerp(y, posNy, 0.02);
		
		if(distance_to_point(posNx, posNy) <= 3)
		{
			image_speed = lerp(image_speed, 0, 0.015);
			
			if(distance_to_point(posNx, posNy) <= 1)
			{
				if(alarm_get(1) <= -1)
				{
					alarm_set(1, room_speed * random_range(0.5, 1));
				}
			}
		}
	} else {
		image_speed = 1;
	}
	//hitpoints
	hitpoints_current = lerp(hitpoints_current, hitpoints_next, 0.2);
	
	//shooting
	if(state == STATES.moving)
	{
		if(target != noone)
		{
			if (collision_circle(x, y, attack_radius, players, false, true))
			{
				state = STATES.attacking;
				image_index = 0;
				
				if(x < target.x) 
				{
					image_xscale = 1;
				} else if(x > target.x)
				{
					image_xscale = -1;
				}
			}
		}
	}