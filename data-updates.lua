local function updateInventoryIfExistedAndExpectedValue( name, newInventory )
	if( data.raw["car"][name] ) then
		if( data.raw["car"][name].inventory_size > newInventory ) then
			data.raw["car"][name].inventory_size = newInventory
		end
	end
end

updateInventoryIfExistedAndExpectedValue("vehicle-hauler", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size)
updateInventoryIfExistedAndExpectedValue("vehicle-miner", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size / 4)
updateInventoryIfExistedAndExpectedValue("vehicle-miner-mk2", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size / 4)
updateInventoryIfExistedAndExpectedValue("vehicle-miner-mk3", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size / 4)
updateInventoryIfExistedAndExpectedValue("vehicle-miner-mk4", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size / 4)
updateInventoryIfExistedAndExpectedValue("vehicle-miner-mk5", data.raw["cargo-wagon"]["cargo-wagon"].inventory_size / 4)

data.raw["car"]["vehicle-hauler"].burner.effectivity = data.raw["car"]["vehicle-hauler"].burner.effectivity / 50
data.raw["car"]["vehicle-miner"].burner.effectivity = data.raw["car"]["vehicle-miner"].burner.effectivity / 50
data.raw["car"]["vehicle-miner-mk2"].burner.effectivity = data.raw["car"]["vehicle-miner-mk2"].burner.effectivity / 50
data.raw["car"]["vehicle-miner-mk3"].burner.effectivity = data.raw["car"]["vehicle-miner-mk3"].burner.effectivity / 50
data.raw["car"]["vehicle-miner-mk4"].burner.effectivity = data.raw["car"]["vehicle-miner-mk4"].burner.effectivity / 50
data.raw["car"]["vehicle-miner-mk5"].burner.effectivity = data.raw["car"]["vehicle-miner-mk5"].burner.effectivity / 50

--
-- Require vehicles to have robotic brains and in general fix their location in the tech tree
--
bobmods.lib.recipe.add_ingredient("vehicle-hauler", {"robot-brain-logistic", 1})
bobmods.lib.recipe.add_ingredient("vehicle-chaingunner", {"robot-brain-logistic", 1})
bobmods.lib.recipe.add_ingredient("vehicle-miner", {"robot-brain-logistic", 1})
bobmods.lib.recipe.add_ingredient("vehicle-miner-mk2", {"robot-brain-logistic", 1})
bobmods.lib.recipe.add_ingredient("vehicle-miner-mk3", {"robot-brain-logistic-mk2", 1})
bobmods.lib.recipe.add_ingredient("vehicle-miner-mk4", {"robot-brain-logistic-mk3", 1})
bobmods.lib.recipe.add_ingredient("vehicle-miner-mk5", {"robot-brain-logistic-mk4", 1})
bobmods.lib.recipe.add_ingredient("vehicle-warden", {"robot-brain-logistic", 1})


bobmods.lib.recipe.add_ingredient("vehicle-miner-mk5", {"robot-brain-logistic-mk4", 1})

-- Flame tank should require a tank (as does the laser tank) 
bobmods.lib.recipe.add_ingredient("vehicle-flame-tank", {"tank", 1})

--
-- Replace iron plates with steel
---
bobmods.lib.recipe.replace_ingredient("vehicle-hauler", "iron-plate", "steel-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-chaingunner", "iron-plate", "steel-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-miner", "iron-plate", "steel-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-miner-mk2", "iron-plate", "brass-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-miner-mk4", "steel-plate", "invar-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-miner-mk4", "steel-plate", "titanium-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-miner-mk5", "steel-plate", "nitiol-plate")
bobmods.lib.recipe.replace_ingredient("vehicle-warden", "iron-plate", "steel-plate")



--
-- Fix AAI's tech structure; move it much later, after robots and vehicles.
--
bobmods.lib.tech.remove_prerequisite("automobilism", "basic-vehicles")

data.raw.technology["basic-vehicles"].unit.count = data.raw.technology["logistic-robotics"].unit.count
bobmods.lib.tech.add_prerequisite("basic-vehicles", "logistic-robotics")
bobmods.lib.tech.add_prerequisite("basic-vehicles", "automobilism")
bobmods.lib.tech.add_science_pack("basic-vehicles", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("basic-vehicles", "logistic-science-pack", 1)

data.raw.technology["vehicle-chaingunner"].unit.count = data.raw.technology["basic-vehicles"].unit.count * 1.25
bobmods.lib.tech.add_prerequisite("vehicle-chaingunner", "basic-vehicles")
bobmods.lib.tech.add_science_pack("vehicle-chaingunner", "logistic-science-pack", 1)

bobmods.lib.tech.add_prerequisite("vehicle-laser-tank", "basic-vehicles")

data.raw.technology["vehicle-miner"].unit.count = data.raw.technology["basic-vehicles"].unit.count * 1.25
bobmods.lib.tech.add_prerequisite("vehicle-miner", "basic-vehicles")
bobmods.lib.tech.add_science_pack("vehicle-miner", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner", "logistic-science-pack", 1)

bobmods.lib.tech.add_science_pack("vehicle-miner-mk2", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk2", "logistic-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk2", "military-science-pack", 1)

bobmods.lib.tech.add_prerequisite("vehicle-miner-mk3", "bob-robots-1")
bobmods.lib.tech.add_science_pack("vehicle-miner-mk3", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk3", "logistic-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk3", "military-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk3", "production-science-pack", 1)

bobmods.lib.tech.add_prerequisite("vehicle-miner-mk4", "bob-robots-2")
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "logistic-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "military-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "production-science-pack", 1)

bobmods.lib.tech.add_prerequisite("vehicle-miner-mk5", "bob-robots-3")
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "automation-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "logistic-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "military-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-miner-mk4", "production-science-pack", 1)

bobmods.lib.tech.add_prerequisite("vehicle-warden", "basic-vehicles")
bobmods.lib.tech.add_science_pack("vehicle-warden", "military-science-pack", 1)
bobmods.lib.tech.add_science_pack("vehicle-warden", "chemical-science-pack", 1)

--
-- Move early construction bots to be unlockable at start because otherwise maintenance is a pain
--
bobmods.lib.tech.replace_science_pack("early-construction-light-armor", "automation-science-pack", "apm_industrial_science_pack" )
bobmods.lib.recipe.replace_ingredient("early-construction-light-armor", "basic-circuit-board", "apm_steam_relay") 
bobmods.lib.recipe.replace_ingredient("early-construction-equipment", "basic-circuit-board", "apm_steam_relay") 

--
-- Make Maintenance Madness's early maintainence gated on the Electricity tech and reduce it's cost to align with
-- other techs
--
bobmods.lib.tech.add_prerequisite("mm-repair-and-maintenance", "apm_power_electricity")
bobmods.lib.tech.remove_prerequisite("mm-repair-and-maintenance", "automation")
bobmods.lib.tech.remove_prerequisite("mm-repair-and-maintenance", "steel-processing")

data.raw["technology"]["mm-repair-and-maintenance"].unit.count = 50

--
-- Move heavy armor later past automation for progression purposes
--
bobmods.lib.tech.add_prerequisite("heavy-armor", "steel-processing")
bobmods.lib.tech.remove_prerequisite("heavy-armor", "apm_puddling_furnace_0")

--
-- Replace industrial science pack with regular science pack for a few techs so you can eventually get out of steam-era science packs
-- TODO: consider making 
--
bobmods.lib.tech.replace_science_pack("engine", "apm_industrial_science_pack", "automation-science-pack" )
bobmods.lib.tech.replace_science_pack("railway", "apm_industrial_science_pack", "automation-science-pack" )
bobmods.lib.tech.replace_science_pack("automated-rail-transportation", "apm_industrial_science_pack", "automation-science-pack" )
bobmods.lib.tech.add_science_pack("automated-rail-transportation", "logistic-science-pack", 1)
bobmods.lib.tech.replace_science_pack("rail-signals", "apm_industrial_science_pack", "automation-science-pack" )
bobmods.lib.tech.add_science_pack("rail-signals", "logistic-science-pack", 1)


--
-- Move steel spare parts into steel puddling research
--

bobmods.lib.tech.add_recipe_unlock("apm_puddling_furnace_0", "mm-mechanical-spare-parts")
bobmods.lib.tech.remove_recipe_unlock("steel-processing", "mm-mechanical-spare-parts")

--
-- Add MSP's science pack throughout the tech tree
--

morescience.tech.add_science_pack_range({"basic-chemistry"}, 1, 2, 1)
morescience.tech.add_science_pack_range({"angels-metallurgy-1", "angels-coal-processing", "water-treatment", "chlorine-processing-1", "electrolysis-1", "chemical-processing-1"}, 1, 3, 1)
morescience.tech.add_science_pack_range({"gardens", "bio-nutrient-paste", "bio-pressing", "bio-wood-processing"}, 1, 4, 1)

morescience.tech.add_science_pack_range({"advanced-ore-refining-1", "ore-advanced-crushing", "slag-processing-1", "geode-processing-2","oil-gas-extraction"}, 1, 7, 1)

morescience.tech.add_science_pack_range({"bio-processing-alien"}, 1, 10, 1)

morescience.tech.add_science_pack_range({"rocket-booster-1"}, 1, 13, 1)

morescience.tech.add_science_pack_range({"observation-satellite", "space-lab", "advanced-probe"}, 1, 30, 1)

--
-- Reduce requirement and make consistent for steam drills 
--
bobmods.lib.recipe.remove_ingredient("apm_steam_mining_drill", "engine-unit")
bobmods.lib.recipe.add_ingredient("apm_steam_mining_drill", {"motor", 6})
bobmods.lib.recipe.add_ingredient("apm_steam_mining_drill", {"pipe", 4})
bobmods.lib.recipe.add_ingredient("apm_steam_mining_drill", {"steel", 4})

bobmods.lib.tech.add_science_pack("apm_steam_mining_drill", "automation-science-pack", 1 )
bobmods.lib.tech.remove_prerequisite("apm_steam_mining_drill", "engine")

-- 
-- Move engine unit tech later so we can make it more expensive since steam drills don't require it anymore
--
bobmods.lib.tech.add_prerequisite("engine", "fluid-handling")


--
-- Remove MSP's science packs from apm_power's first lab
--
data.raw["lab"]["apm_lab_0"].inputs = {
		"apm_industrial_science_pack",
	}

--
-- Make fluid control available earlier
-- Otherwise managing recylcing of coal-water requires a lot of manual intervention
--
bobmods.lib.tech.remove_prerequisite("angels-fluid-control","basic-chemistry")
bobmods.lib.tech.add_prerequisite("angels-fluid-control", "apm_power_steam")
bobmods.lib.tech.replace_science_pack("angels-fluid-control", "automation-science-pack", "apm_industrial_science_pack" )