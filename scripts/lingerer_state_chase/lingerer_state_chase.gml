function lingerer_state_chase(){

	// Get player position
	//dirx = sign(obj_player.x - x);
	dirx = point_direction(x, y, obj_player.x, obj_player.y);	
	x_speed =  lengthdir_x(.3, dirx);
	
	
	// Add gravity
	y_speed++;
	
	// Collisions and movement calculations
	x_collisions(obj_platform);
	y_collisions(obj_platform);
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	
	// Actual Movement
	x += x_speed;
	y += y_speed;
	
	// Sprites
	sprite_index = spr_zombie1_run;
	image_xscale = sign(x_speed);
	
	// Transitions
	if (!collision_circle(x, y, 360, obj_player, false, false)) { _enemy_state = enemy_state.idle; }
	if (collision_line(x - 32, y, x + 32, y, obj_player, false, false)) { _enemy_state = enemy_state.attack; }
}