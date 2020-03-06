// Oscillate the cursor using sin function
cursorLevitate = dsin(cursorTime);

// Use this as an "angle" to use in the sin function
// to oscillate cursor
cursorTime += leviRate;


// Vertical input is determined by the press of up
// and down buttons
var vert =  keyboard_check_pressed(downButt) -  keyboard_check_pressed(upButt);

// Move cursor up or down depending on inputs
selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement

// Don't let cursor move past where it should be
selected = clamp(selected, 0, array_length_1d(menu) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt))
{
	if(selected == 0) // Play by default
	{
		room_goto(rm_game);
	}
	
	if(selected == 1) // Options by default
	{
		show_message(	"Use your cannons to destroy your enemy's walls.\n"+
						"If you can't keep your castle surrounded by walls, you lose!");
	}
	
	if(selected == 2) // Stats by default
	{
		
		show_message(	"Player 1: Move: arrow keys, Rotate: right shift, Action: enter,\nCycle Weapons: numpad 1 and 2 \n\n" +
						"Player 2: Move: wasd, Rotate: r, Action: t, Cycle Weapons: q and e");

	}
	
	if(selected == 3) // Exit by default
	{
		game_end();
	}
}