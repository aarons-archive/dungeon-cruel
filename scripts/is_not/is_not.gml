function is_not(){
	var current_value = argument[0];
	var return_value = true;
	
	for(var index = 1; index < argument_count; index ++) {
		if(current_value == argument[index]) {
			return_value = false;
			break;
		}
	}
	
	return return_value;
}