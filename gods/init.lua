dofile(minetest.get_modpath("gods") .. "/api.lua")

gods.register_god("zeus", {
	type = "greek",
	abilities = { "lightning", "air" },
	power = 1000,
})
