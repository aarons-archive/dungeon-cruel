// Inherit the parent event
event_inherited();

//animation states
	switch(state)
	{
		case STATES.hit:
			image_speed = 1;
			if(is_not(sprite_index, s_enemy_hurt ))
			{ 
				sprite_index = s_enemy_hurt;
			}
		break;
		case STATES.death:
			image_speed = 1;
			sprite_index = s_enemy_dead;
		break;
		case STATES.attacking:
			image_speed = 1;
			sprite_index = s_enemy_attack;
		break;
		default:
			sprite_index = s_enemy_idle;
		break;
	}

