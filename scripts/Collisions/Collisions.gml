function collision()
{
	//set target value
	var _tx = x;
	var _ty = y;

	//move back to last step pos
	x = xprevious;
	y = yprevious;
	
	//get distance we want to move
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);

	//move as far in x/y before hitting solid
	repeat(_disx)
	{
		if !place_meeting(x + sign(_tx - x), y, oSolid) x += sign(_tx - x);
	}
	
	repeat(_disy)
	{
		if !place_meeting(x, y + sign(_ty - y), oSolid) y += sign(_ty - y);
	}
}
