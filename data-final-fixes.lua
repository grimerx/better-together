function debug(logtext)
	if (enabledebug) then
		log("SCTD: " .. logtext)
	end
end

local function change_ingredient_quantity(ingredientstable, ingredientname, newQuantity)
	local removed = false
	for _i, ingredient in pairs(ingredientstable) do
		if ingredient and (ingredient[1] == ingredientname or (ingredient.name and ingredient.name == ingredientname)) then
			ingredient.amount = newQuantity
			break
		end
	end
end

function recipe_ingredient_change_quantity(recipename, ingredientname, newNormalQuantity, newExpensiveQuantity)
	local removed = false
	if data.raw.recipe[recipename] then
		local recipe = data.raw.recipe[recipename]
		local hasdiff = false
		if recipe.normal then
			if recipe.normal.ingredients then
				change_ingredient_quantity(recipe.normal.ingredients, ingredientname, newNormalQuantity)
			end
			hasdiff = true
		end
		if recipe.expensive then
			if recipe.expensive.ingredients then
				change_ingredient_quantity(recipe.expensive.ingredients, ingredientname, newExpensiveQuantity)
			end
			hasdiff = true
		end
		if not hasdiff then
			if recipe.ingredients then
				change_ingredient_quantity(recipe.ingredients, ingredientname, newNormalQuantity)
			end
		end		
	end
	if not data.raw.recipe[recipename] then
		debug("attempting to update nonexistent recipe " .. recipename)
	end
	return removed
end

-- apm_energy's first steel facility procudes steel more cheaply than the expensive 8:1 recipe Angels has at the beginning. 
-- It is important not to break this as facilitating iron ore production is an important time of progression and factory design management due to steel efficiency gains with liquid steel.
-- For example, without a copper sink, iron ore cannot be produed and thus cannot produce liquid steel, thus must make expensive steel.
recipe_ingredient_change_quantity("apm_steel_0","angels-ore1-crushed",72,108)

-- Wood 1 is a net loss on expensive due to ash production costs, so reduce ash costs.
recipe_ingredient_change_quantity("apm_wood_ash_production","apm_wood_pellets",1,1)


-- Fix up MSP leftovers
bobmods.lib.tech.remove_science_pack("stone-walls","more-science-pack-1")

bobmods.lib.tech.remove_science_pack("turrets","more-science-pack-1")
bobmods.lib.tech.remove_science_pack("turrets","more-science-pack-2")
bobmods.lib.tech.remove_science_pack("turrets","more-science-pack-3")

bobmods.lib.tech.remove_science_pack("military","more-science-pack-1")
bobmods.lib.tech.remove_science_pack("military","more-science-pack-2")
bobmods.lib.tech.remove_science_pack("military","more-science-pack-3")

bobmods.lib.tech.remove_science_pack("physical-projectile-damage-1","more-science-pack-1")
bobmods.lib.tech.remove_science_pack("physical-projectile-damage-1","more-science-pack-2")
bobmods.lib.tech.remove_science_pack("physical-projectile-damage-1","more-science-pack-3")

bobmods.lib.tech.remove_science_pack("weapon-shooting-speed-1","more-science-pack-1")
bobmods.lib.tech.remove_science_pack("weapon-shooting-speed-1","more-science-pack-2")
bobmods.lib.tech.remove_science_pack("weapon-shooting-speed-1","more-science-pack-3")

bobmods.lib.tech.remove_science_pack("heavy-armor","more-science-pack-1")
bobmods.lib.tech.remove_science_pack("heavy-armor","more-science-pack-2")
bobmods.lib.tech.remove_science_pack("heavy-armor","more-science-pack-3")

--
-- Restore SCTM stuff that apm_power disabled
--

data.raw["recipe"]["lab"].enabled = true
data.raw["recipe"]["lab"].expensive.enabled = true
data.raw["recipe"]["lab"].normal.enabled = true

bobmods.lib.tech.add_recipe_unlock("optics", "lab");
bobmods.lib.tech.add_recipe_unlock("optics", "sct-lab1-construction");
bobmods.lib.tech.add_recipe_unlock("optics", "sct-lab1-mechanization");

bobmods.lib.tech.add_prerequisite("more-science-pack-3", "basic-chemistry")
bobmods.lib.tech.remove_prerequisite("more-science-pack-3", "turrets")

bobmods.lib.recipe.replace_ingredient('sct-lab-t2', 'apm_lab_1', 'lab')

--
-- Remove AAI Vehicle Fuel stuff as it no longer applies
--
data.raw.technology["fuel-processing"].enabled = false

--
-- Remove AAI character progression techs
-- 
data.raw.technology["toolbelt-2"].enabled = false 
data.raw.technology["toolbelt-3"].enabled = false 
data.raw.technology["toolbelt-4"].enabled = false 
data.raw.technology["toolbelt-5"].enabled = false 
data.raw.technology["toolbelt-6"].enabled = false

--
-- Remove Coal & Steam's air filtering (We use Air Filtering Advanced's)
--
data.raw.technology["apm_air_cleaner_machine"].enabled = false

--
-- Remove Electric Crusher
--
data.raw.technology["apm_crusher_machine_2"].enabled = false

--
-- Move electric crushig recipes to unlock with Angel's crusher
--

bobmods.lib.tech.add_recipe_unlock("ore-crushing", "apm_crusher_drumms");
bobmods.lib.tech.add_recipe_unlock("ore-crushing", "apm_crusher_drumms_used_repair");
bobmods.lib.tech.add_recipe_unlock("ore-crushing", "apm_wood_pellets_2");
bobmods.lib.tech.add_recipe_unlock("ore-crushing", "apm_coal_crushed_3");

--
-- Move AAI unit controls to unlock with vehicles
--

bobmods.lib.tech.add_recipe_unlock("basic-vehicles", "unit-remote-control");
bobmods.lib.tech.add_recipe_unlock("basic-vehicles", "path-remote-control");
data.raw.recipe["unit-remote-control"].enabled = false;
data.raw.recipe["path-remote-control"].enabled = false;

--
-- Move expanded cargo's Data Processing Lab to unlock with the packs it processes
--
bobmods.lib.tech.add_recipe_unlock("space-telescope", "erp-lab" );
data.raw.recipe["erp-lab"].enabled = false;

--
-- Undo Engine/Vehicle tech changes made by AAI
--
bobmods.lib.tech.add_science_pack("engine", "logistic-science-pack", 1)
bobmods.lib.tech.add_prerequisite("engine", "logistic-science-pack")

data.raw["technology"]["automobilism"].unit.time = 30



--
-- Hide various things for cleanliness
--
data.raw.item["apm_crusher_machine_2"].hidden = true
data.raw.item["burner-assembling-machine"].hidden = true

