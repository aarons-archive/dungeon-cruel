switch(state)
{
	case STATES.hit:
		sprite_index = s_enemy_walk;
		state = STATES.moving;
	break;
	case STATES.death:
		instance_destroy();
		
	case STATES.attacking:
		var pdirection = point_direction(x, y, target.x, target.y);
		var bullet = instance_create_layer(x, y, "Arrows", oEnemyRangedBullet);
		bullet.direction = pdirection;
		bullet.speed = 4;
		sprite_index = s_enemy_walk;
		state = STATES.moving;
	break;
	
}