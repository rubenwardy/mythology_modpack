gods = {
	registered_gods = {},
	players = {},
}

function gods.register_god(name, def)
	def.name   = name
	def.type   = "god"
	def.is_npc = true
	gods.registered_gods[name] = def
	gods.players[name] = def
end

function gods.get_player_or_nil(name)
	return gods.players[name]
end

function gods.get_player(name)
	local player = gods.players[name] or {
		type = "mortal",
		name = name,
	}
	gods.players[name] = player
	return player
end

function gods.set_player_parent(name, parent, idx)
	local parent_name = parent.name or parent

	local player = gods.get_player(name)
	if player.type == "mortal" then
		player.type = "demigod"
	end
	player.parents[idx or (#gods.players.parents + 1)] = parent_name
end

minetest.register_on_prejoinplayer(function(name, ip)
	local player = gods.players[name:lower()]
	if player and player.is_npc then
		return "Please choice another name, that one is used by an NPC."
	end
end)
