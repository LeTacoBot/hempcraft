--Hemp Seeds
minetest.register_craftitem("hempcraft:hseeds", {
	description = "Hemp Seeds",
	inventory_image = "hempcraft_hseeds.png"
})
minetest.register_craft({
	type = "shapeless",
	output = "hempcraft:hseeds",
	recipe = {"default:grass_1", "default:grass_1", "default:junglegrass", "default:junglegrass"}
})

--Fibre
minetest.register_craftitem("hempcraft:fibre", {
	description = "Industrial Fibre",
	inventory_image = "hempcraft_fibre.png"
})
minetest.register_craft({
	output = "hempcraft:fibre",
	recipe = {
		{"hempcraft:hemp"},
		{"hempcraft:hemp"},
		{"hempcraft:hemp"}
	}
})

--Salad
minetest.register_craftitem("hempcraft:salad", {
	description = "Hempatic Salad",
	inventory_image = "hempcraft_salad.png",
	on_use = minetest.item_eat(2)
})
minetest.register_craft({
	output = "hempcraft:salad",
	type = "shapeless",
	recipe = {"hempcraft:hemp", "hempcraft:hemp"}
})

--Hempcrete Mix
minetest.register_craftitem("hempcraft:hempcrete_mix", {
	description = "Hempcrete Mix",
	inventory_image = "hempcraft_hempcrete_mix.png"
})
minetest.register_craft({
	output = "hempcraft:hempcrete_mix",
	type = "shapeless",
	recipe = {"hempcraft:hemp", "default:sand", "default:clay_lump"}
})

--Hempcrete
minetest.register_node("hempcraft:hempcrete", {
	description = "Hempcrete",
	is_ground_content = true,
	tiles = {"hempcraft_hempcrete.png"},
	groups = {choppy=3, cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
	type = "cooking",
	recipe = "hempcraft:hempcrete_mix",
	output = "hempcraft:hempcrete 4",
})

--Hemplamp
minetest.register_node("hempcraft:hemplamp", {
	description = "Hempatic Lamp",
	light_source = 14,
	drawtype = "glasslike_framed",
	is_ground_content = true,
	tiles = {"hempcraft_hemplamp.png"},
	groups = {choppy=3, cracky=3},
})
minetest.register_craft({
	recipe = {
				{"hempcraft:fibre", "hempcraft:fibre", "hempcraft:fibre"},
				{"hempcraft:fibre", "default:torch", "hempcraft:fibre"},
				{"hempcraft:fibre", "hempcraft:fibre", "hempcraft:fibre"}
			},
	output = "hempcraft:hemplamp"
})

--Hemp
minetest.register_node("hempcraft:hemp", {
	description = "Hemp",
	drawtype = "plantlike",
	tiles = {"hempcraft_hemp.png"},
	inventory_image = "hempcraft_hemp.png",
	wield_image = "hempcraft_hemp.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.35, -0.55, -0.35, 0.35, 0.55, 0.35}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})
minetest.register_abm({
	nodenames = {"hempcraft:hemp"},
	interval = 14,
	chance = 71,
	action = function(pos, node)
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
			if minetest.get_node({x = pos.x, y = pos.y - 4, z = pos.z}).name ~= "hempcraft:hemp" then
				minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "hempcraft:hemp"})
			end
		end
	end,
})
minetest.register_craft({
	type = "shapeless",
	output = "hempcraft:hemp",
	recipe = {"hempcraft:hseeds", "hempcraft:hseeds"}
})

--BTW Your mum lol

minetest.register_tool("hempcraft:pick_hemp", {
	description = "Hempcrete Pickaxe",
	inventory_image = "hempcraft_hemppick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("hempcraft:shovel_hemp", {
	description = "Hempcrete Shovel",
	inventory_image = "hempcraft_hempshovel.png",
	wield_image = "hempcraft_hempshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

minetest.register_tool("hempcraft:axe_hemp", {
	description = "Hempcrete Axe",
	inventory_image = "hempcraft_hempaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("hempcraft:sword_hemp", {
	description = "Hempcrete Sword",
	inventory_image = "hempcraft_hempsword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})

minetest.register_node("hempcraft:hemp_rope", {
	description = "Hempatic Rope",
	drawtype = "signlike",
	tiles = {"hempcraft_rope.png"},
	inventory_image = "hempcraft_rope.png",
	wield_image = "hempcraft_rope.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = 'hempcraft:axe_hemp',
	recipe = {
		{'hempcraft:hempcrete', 'hempcraft:hempcrete'},
		{'group:stick', 'hempcraft:hempcrete'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'hempcraft:axe_hemp',
	recipe = {
		{'hempcraft:hempcrete', 'hempcraft:hempcrete'},
		{'hempcraft:hempcrete', 'group:stick'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'hempcraft:pick_hemp',
	recipe = {
		{'hempcraft:hempcrete', 'hempcraft:hempcrete', 'hempcraft:hempcrete'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'hempcraft:shovel_hemp',
	recipe = {
		{'hempcraft:hempcrete'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'hempcraft:sword_hemp',
	recipe = {
		{'hempcraft:hempcrete'},
		{'hempcraft:hempcrete'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'hempcraft:hemp_rope 3',
	recipe = {
		{'hempcraft:fibre'},
		{'hempcraft:fibre'},
		{'hempcraft:fibre'},
	}
})

--- Comment out this section to remove farming dependency ---

farming.register_hoe(":hempcraft:hoe_hemp", {
	description = "Hempcrete Hoe",
	inventory_image = "hempcraft_hemphoe.png",
	max_uses = 90,
	material = "hempcraft:hempcrete"
})

minetest.register_craft({
	output = "farming:cotton",
	recipe = {
		{"hempcraft:fibre"},
	}
})

--------------------------------------------------------------
