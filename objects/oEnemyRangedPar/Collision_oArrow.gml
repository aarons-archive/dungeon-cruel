if(state == STATES.death)
{
	return;
}

with(other)
{
	instance_destroy();
}

//change state
state = STATES.hit;

//reset frame number
image_index = 0;

//stop movement
posNx = x;
posNy = y;

//remove hitpoint
hitpoints_next -= 1;

//check if we can die now
if(hitpoints_next <= 0)
{
	state = STATES.death;
}
