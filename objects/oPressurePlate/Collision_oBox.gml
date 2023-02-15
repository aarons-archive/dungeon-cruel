// collision with button code

if (image_index == 0) {image_index = 1;	
	
	if (instance_exists(oDoor)){
		with(oDoor)
		{
			if (plateActivate == other.plateActivate) {plateActive = true; }
		}
	}
}
