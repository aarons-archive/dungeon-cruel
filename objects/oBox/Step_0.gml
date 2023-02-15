// checking 
if ( state == "idle" ) { exit; }

if ( state == "move" ) 
{
	var xRight  = 0; 
	var xLeft   = 0; 
	var yTop    = 0; 
	var yBottom = 0;

	if (direction == 0)	{xRight = pushSpeed;}
	if (direction == 180) {xLeft = -pushSpeed;}
	if (direction == 90)  {yTop = -pushSpeed;}
	if (direction == 270) {yBottom = pushSpeed;}

	if (collision_rectangle(bbox_left + xLeft, bbox_top + yTop, bbox_right + xRight, bbox_bottom + yBottom, oStaticBlock,0,0)) { state = "idle"; speed = 0;}
	if (collision_rectangle(bbox_left + xLeft, bbox_top + yTop, bbox_right + xRight, bbox_bottom + yBottom, oSolid,0,0)) { state = "idle"; speed = 0;}
	}