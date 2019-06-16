data:extend({
	{
		type = "item-group",
		name = "mm-main-group",
		order = "z-z",
		icon = "__grimerx-better-together__/graphics/icons/item-group.png",
		icon_size = 64,
	},
    {
        type = "item-subgroup",
        name = "mm-scrap",
        group = "mm-main-group",
        order = "a",
    },
    {
		type = "repair-tool",
		name = "gxbt-fish-oil",
		icon = "__MaintenanceMadness__/graphics/tools/machine-oil.png",
		icon_size = 64,
		flags = {},
		subgroup = "tool",
		order = "b[repair]-e[repair-pack]",
		speed = 0.5,
		durability = 50,
		stack_size = 100
	},