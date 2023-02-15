// collision with button code

if (image_index == 0) {image_index = 1;	
	
	if (instance_exists(oDoor)){
		with(oDoor)
		{
			if (activate == other.activate) {active = true; }
		}
	}
}
