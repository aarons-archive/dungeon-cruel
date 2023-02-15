//Button to reduce hp for Knight

//if(keyboard_check_pressed(ord("K")))
//{
//	damage_takenKnight = damMaxKnight;

//	if (hpCurrentKnight - damage_takenKnight) >= 0 hpCurrentKnight -= damage_takenKnight;
//	else hpCurrentKnight = 0;
//}

xscaleYellow = hpNextKnight / global.hpMaxKnight;
xscaleGreen = hpCurrentKnight / global.hpMaxKnight;

if (hpNextKnight >  hpCurrentKnight)
{
	hpCurrentKnight -= 0.2;
}

//Button to reduce hp for Skele

if(keyboard_check_pressed(ord("L")))
{
	damage_takenSkele = damMaxSkele;
	
	if (hpCurrentSkele - damage_takenSkele) >= 0 hpCurrentSkele -= damage_takenSkele;
	else hpCurrentSkele = 0;
}

xscaleYellow = hpNextSkele / global.hpMaxSkele;
xscaleGreen = hpCurrentSkele / global.hpMaxSkele;

if (hpNextSkele > hpCurrentSkele)
{
	hpCurrentSkele -= 0.2;
}
