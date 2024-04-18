require("scripts/config")
require("scripts/fluids")
require("scripts/icons")
require("scripts/icon_overlays")
require("scripts/sprites")

if config("copper-plate-custom") then
  replace_icon("item", "copper-plate", CustomIcons["copper-plate"])
end

if config("electronic-circuit-custom") then
  replace_icon("item", "electronic-circuit", CustomIcons["electronic-circuit"])
end

overlay_icon("blueprint", "blueprint", Overlays["blueprint"])
overlay_icon("deconstruction-item", "deconstruction-planner", Overlays["deconstruction-planner"])
overlay_icon("upgrade-item", "upgrade-planner", Overlays["upgrade-planner"])

local nuclear_overlay = Overlays["nuclear"]
local nuclear_sprite_overlay = icon_to_sprite(nuclear_overlay)
overlay_icon("item", "nuclear-fuel", nuclear_overlay)
overlay_icon("item", "uranium-235", nuclear_overlay)
overlay_icon("item", "uranium-fuel-cell", nuclear_overlay)
overlay_icon("ammo", "uranium-cannon-shell", nuclear_overlay)
overlay_icon("ammo", "uranium-rounds-magazine", nuclear_overlay)
overlay_icon("ammo", "atomic-bomb", nuclear_overlay)
overlay_picture("item", "nuclear-fuel", nuclear_sprite_overlay)
overlay_picture("item", "uranium-235", nuclear_sprite_overlay)
overlay_picture("item", "uranium-fuel-cell", nuclear_sprite_overlay)
overlay_picture("ammo", "uranium-cannon-shell", nuclear_sprite_overlay)
overlay_picture("ammo", "uranium-rounds-magazine", nuclear_sprite_overlay)
overlay_picture("ammo", "atomic-bomb", nuclear_sprite_overlay)

local explosive_overlay = Overlays["explosives"]
overlay_icon("ammo", "explosive-cannon-shell", explosive_overlay)
overlay_icon("ammo", "explosive-rocket", explosive_overlay)
overlay_icon("capsule", "cluster-grenade", explosive_overlay)

overlay_icon("capsule", "cliff-explosives", Overlays["cliff"])

local shifted_explosive_overlay = table_merge(explosive_overlay, BaseOverlays.shifted)
overlay_icon("ammo", "explosive-uranium-cannon-shell", nuclear_overlay, shifted_explosive_overlay)
overlay_picture("ammo", "explosive-uranium-cannon-shell", nuclear_sprite_overlay, icon_to_sprite(shifted_explosive_overlay))

-- TODO: improve graphic.
local piercing_overlay = Overlays["piercing"]
overlay_icon("ammo", "piercing-rounds-magazine", piercing_overlay)
overlay_icon("ammo", "piercing-shotgun-shell", piercing_overlay)

local productivity_overlay = Overlays["productivity"]
overlay_icon("module", "productivity-module", productivity_overlay)
overlay_icon("module", "productivity-module-2", productivity_overlay)
overlay_icon("module", "productivity-module-3", productivity_overlay)

local effectivity_overlay = Overlays["effectivity"]
overlay_icon("module", "effectivity-module", effectivity_overlay)
overlay_icon("module", "effectivity-module-2", effectivity_overlay)
overlay_icon("module", "effectivity-module-3", effectivity_overlay)

local speed_overlay = Overlays["speed"]
overlay_icon("module", "speed-module", speed_overlay)
overlay_icon("module", "speed-module-2", speed_overlay)
overlay_icon("module", "speed-module-3", speed_overlay)
overlay_icon("capsule", "slowdown-capsule", speed_overlay)

-- TODO: fix these for entities.
overlay_icon("item", "logistic-chest-active-provider", Overlays["pushes"])
overlay_icon("item", "logistic-chest-passive-provider", Overlays["generates"])
overlay_icon("item", "logistic-chest-buffer", Overlays["buffer"])
overlay_icon("item", "logistic-chest-requester", Overlays["consumes"])
overlay_icon("item", "logistic-chest-storage", Overlays["storage"])

overlay_icon("tool", "automation-science-pack", Overlays["iron-gear-wheel"])
overlay_icon("tool", "logistic-science-pack", Overlays["inserter"])
overlay_icon("tool", "military-science-pack", Overlays["piercing-rounds-magazine"])
overlay_icon("tool", "chemical-science-pack", Overlays["sulfuric-acid"])
overlay_icon("tool", "production-science-pack", Overlays["productivity-module"])
overlay_icon("tool", "utility-science-pack", Overlays["processing-unit"])
overlay_icon("tool", "space-science-pack", Overlays["satellite"])

-- TODO: fix these for entities.
overlay_icon("item", "fast-inserter", speed_overlay)
overlay_icon("item", "filter-inserter", Overlays["filter"])
overlay_icon("item", "stack-inserter", Overlays["storage"])
overlay_icon("item", "stack-filter-inserter",
  Overlays["storage"],
  table_merge(Overlays["filter"], BaseOverlays.shifted)
)
overlay_icon("item", "long-handed-inserter", Overlays["pushes"])
overlay_icon("item", "burner-inserter", Overlays["coal"])

local iron_overlay = Overlays["iron-plate"]
overlay_icon("item", "iron-ore", iron_overlay)
overlay_pictures("item", "iron-ore", icon_to_sprite(iron_overlay))
local copper_overlay = config("copper-plate-custom") and Overlays["copper-plate-custom"] or Overlays["copper-plate"]
overlay_icon("item", "copper-ore", copper_overlay)
overlay_pictures("item", "copper-ore", icon_to_sprite(copper_overlay))
local uranium_overlay = Overlays["uranium"]
overlay_icon("item", "uranium-ore", uranium_overlay)
overlay_pictures("item", "uranium-ore", icon_to_sprite(uranium_overlay))
local stone_overlay = Overlays["stone-brick"]
overlay_icon("item", "stone", stone_overlay)
overlay_pictures("item", "stone", icon_to_sprite(stone_overlay))

local oil_overlay = Overlays["pumpjack"]
overlay_icon("fluid", "crude-oil", oil_overlay)
overlay_icon("item", "crude-oil-barrel", oil_overlay)
overlay_fluid_barreling("crude-oil")
local lube_overlay = Overlays["iron-gear-wheel"]
overlay_icon("fluid", "lubricant", lube_overlay)
overlay_icon("item", "lubricant-barrel", lube_overlay)
overlay_fluid_barreling("lubricant")
local petrol_overlay = Overlays["petroleum-gas"]
overlay_icon("item", "petroleum-gas-barrel", petrol_overlay)
local sulfuric_acid_overlay = Overlays["sulfuric-acid"]
overlay_icon("item", "sulfuric-acid-barrel", sulfuric_acid_overlay)

overlay_or_replace_fluid("heavy-oil")
overlay_or_replace_fluid("light-oil")
overlay_or_replace_fluid("water")

replace_icon("recipe", "advanced-oil-processing", EmptyIcon)
overlay_icon("recipe", "advanced-oil-processing", get_and_shift_fluid_icons("petroleum-gas", {0, 8}, 0.5))
overlay_icon("recipe", "advanced-oil-processing", get_and_shift_fluid_icons("heavy-oil", {-12, 8}, 0.5))
overlay_icon("recipe", "advanced-oil-processing", get_and_shift_fluid_icons("light-oil", {12, 8}, 0.5))
overlay_icon("recipe", "advanced-oil-processing", get_and_shift_fluid_icons("water", {-4.5, -8}, 0.5))
overlay_icon("recipe", "advanced-oil-processing", get_and_shift_fluid_icons("crude-oil", {4.5, -8}, 0.5))

log(serpent.block(data.raw["recipe"]["advanced-oil-processing"]))