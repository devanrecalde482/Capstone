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
if(keyboard_check_pressed(confirmButt)){
	if(selected == 0){
		room_goto(rm_game);
	}
	
	// Options by default
	if(selected == 1){
		show_message(	"Use your cannons to destroy your enemy's walls.\n"+
						"If you can't keep your castle surrounded by walls, you lose!");
	}
	// Stats by default
	if(selected == 2){
		show_message(	"Player 1: arrow keys, right shift, enter\n" +
						"Player 2: wasd, r, t");

	}
	
	if(selected == 3){
		game_end();
	}
	
}