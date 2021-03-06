local S = mobs_animals.S

mobs:register_mob("mobs_animals:fox", {
	description = S"Fox",
	type = "animal",
	visual = "mesh",
	mesh = "mobs_fox.b3d",
	collisionbox = {-0.4, -0.45, -0.4, 0.4, 0.45, 0.4},
	animation = {
		speed_normal = 25,
		speed_run = 25,
		walk_start = 1,
		walk_end = 12,
		stand_start = 26,
		stand_end = 46,
		run_start = 13,
		run_end = 25,
		punch_start = 82,
		punch_end = 94,
	},
	textures = {"mobs_fox.png"},
	runaway = false,
	jump = false,
	walk_chance = 75,
	walk_velocity = 1,
	run_velocity = 2.5,
	view_range = 14,
	follow = {
		"mobs_animals:chicken_raw"
	},
	damage = 3,
	group_attack = true,
	hp_min = 20,
	hp_max = 24,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fear_height = 4,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 2, min = 0, max = 1},
	},
	replace_what = {
		"farming:blueberry_4", "farming:raspberry_4"
	},
	replace_with = "air",
	replace_rate = 10,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 10, true, true) then return end

	--	mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})

mobs:spawn({
	name = "mobs_animals:fox",
	mobs_animal.spawn_nodes,
	chance = 30000,
	min_height = 0,
	day_toggle = true
})

mobs:register_egg("mobs_animals:fox", S"Fox Egg", "mobs_fox_egg.png")
