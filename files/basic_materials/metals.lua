-- Translation support
local translator = minetest.get_translator
local S = translator and translator("basic_materials") or intllib.make_gettext_pair()

if translator and not minetest.is_singleplayer() then
	local lang = minetest.settings:get("language")
	if lang and lang == "ru" then
		S = intllib.make_gettext_pair()
	end
end

-- items

minetest.register_craftitem("basic_materials:steel_wire", {
	description = S("Spool of steel wire"),
	groups = { wire = 1 },
	inventory_image = "basic_materials_steel_wire.png"
})

minetest.register_craftitem("basic_materials:copper_wire", {
	description = S("Spool of copper wire"),
	groups = { wire = 1 },
	inventory_image = "basic_materials_copper_wire.png"
})

minetest.register_craftitem("basic_materials:silver_wire", {
	description = S("Spool of silver wire"),
	groups = { wire = 1 },
	inventory_image = "basic_materials_silver_wire.png"
})

minetest.register_craftitem("basic_materials:gold_wire", {
	description = S("Spool of gold wire"),
	groups = { wire = 1 },
	inventory_image = "basic_materials_gold_wire.png"
})

minetest.register_craftitem("basic_materials:steel_strip", {
	description = S("Steel Strip"),
	groups = { strip = 1 },
	inventory_image = "basic_materials_steel_strip.png"
})

minetest.register_craftitem("basic_materials:copper_strip", {
	description = S("Copper Strip"),
	groups = { strip = 1 },
	inventory_image = "basic_materials_copper_strip.png"
})

minetest.register_craftitem("basic_materials:steel_bar", {
	description = S("Steel Bar"),
	inventory_image = "basic_materials_steel_bar.png",
})

minetest.register_craftitem("basic_materials:chainlink_brass", {
	description = S("Chainlinks (brass)"),
	groups = { chainlinks = 1 },
	inventory_image = "basic_materials_chainlink_brass.png"
})

minetest.register_craftitem("basic_materials:chainlink_steel", {
	description = S("Chainlinks (steel)"),
	groups = { chainlinks = 1 },
	inventory_image = "basic_materials_chainlink_steel.png"
})

minetest.register_craftitem("basic_materials:brass_ingot", {
	description = S("Brass Ingot"),
	inventory_image = "basic_materials_brass_ingot.png",
})

minetest.register_craftitem("basic_materials:gear_steel", {
	description = S("Steel gear"),
	inventory_image = "basic_materials_gear_steel.png"
})

minetest.register_craftitem("basic_materials:padlock", {
	description = S("Padlock"),
	inventory_image = "basic_materials_padlock.png"
})

-- nodes

local chains_sbox = {
	type = "fixed",
	fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }
}

minetest.register_node("basic_materials:chain_steel", {
	description = S("Chain (steel, hanging)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_steel_inv.png",
	groups = {cracky=3},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:chain_brass", {
	description = S("Chain (brass, hanging)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_brass_inv.png",
	groups = {cracky=3},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:brass_block", {
	description = S("Brass Block"),
	tiles = { "basic_materials_brass_block.png" },
	is_ground_content = false,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_metal_defaults()
})

-- crafts

minetest.register_craft( {
	output = "basic_materials:copper_wire 2",
	type = "shapeless",
	recipe = {
		"default:copper_ingot",
		"basic_materials:empty_spool",
		"basic_materials:empty_spool",
	},
})

minetest.register_craft( {
	output = "basic_materials:silver_wire 2",
	type = "shapeless",
	recipe = {
		"default:silver_ingot",
		"basic_materials:empty_spool",
		"basic_materials:empty_spool",
	},
})

minetest.register_craft( {
	output = "basic_materials:gold_wire 2",
	type = "shapeless",
	recipe = {
		"default:gold_ingot",
		"basic_materials:empty_spool",
		"basic_materials:empty_spool",
	},
})

minetest.register_craft( {
	output = "basic_materials:steel_wire 2",
	type = "shapeless",
	recipe = {
		"default:steel_ingot",
		"basic_materials:empty_spool",
		"basic_materials:empty_spool",
	},
})

minetest.register_craft( {
	output = "basic_materials:steel_strip 12",
	recipe = {
		{ "", "default:steel_ingot", "" },
		{ "default:steel_ingot", "", "" },
	},
})

minetest.register_craft( {
	output = "basic_materials:copper_strip 12",
	recipe = {
		{ "", "default:copper_ingot", "" },
		{ "default:copper_ingot", "", "" },
	},
})

minetest.register_craft( {
	output = "basic_materials:steel_bar 6",
	recipe = {
		{ "", "", "default:steel_ingot" },
		{ "", "default:steel_ingot", "" },
		{ "default:steel_ingot", "", "" },
	},
})

minetest.register_craft( {
	output = "basic_materials:padlock 2",
	recipe = {
		{ "basic_materials:steel_bar" },
		{ "default:steel_ingot" },
		{ "default:steel_ingot" },
	},
})

minetest.register_craft({
	output = "basic_materials:chainlink_steel 12",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "default:steel_ingot", "default:steel_ingot", "" },
	},
})

minetest.register_craft({
	output = "basic_materials:chainlink_brass 12",
	recipe = {
		{"", "basic_materials:brass_ingot", "basic_materials:brass_ingot"},
		{ "basic_materials:brass_ingot", "", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "" },
	},
})

minetest.register_craft({
	output = 'basic_materials:chain_steel 2',
	recipe = {
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"}
	}
})

minetest.register_craft({
	output = 'basic_materials:chain_brass 2',
	recipe = {
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"}
	}
})

minetest.register_craft( {
	output = "basic_materials:gear_steel 6",
	recipe = {
		{ "", "default:steel_ingot", "" },
		{ "default:steel_ingot","basic_materials:chainlink_steel", "default:steel_ingot" },
		{ "", "default:steel_ingot", "" }
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "basic_materials:brass_ingot 3",
	recipe = {
		"default:copper_ingot",
		"default:copper_ingot",
		"default:silver_ingot",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "basic_materials:brass_ingot 9",
	recipe = { "basic_materials:brass_block" },
})

minetest.register_craft( {
	output = "basic_materials:brass_block",
	recipe = {
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
	},
})