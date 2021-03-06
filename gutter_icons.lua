function insert_icon(icons, name, sprite_order, row_offset)
  local this_piece = tablex.deepcopy(standard_piece)
  this_piece.name = name
  this_piece.quad = love.graphics.newQuad(
    0, (11 * 63) + row_offset + sprite_order * standard_piece.height + 1, -- start x, y of sprite
    standard_piece.width, standard_piece.height, -- width, height of each sprite
    64, 1408) -- width, height of sprite file
  id = string.lower(name)
  id = string.gsub(id, " ", "_")
  icons[id] = this_piece
end

local function set_icon_coords()
  set_coords(gutter_icons.mountain, 1,
               {x=gutter_x_offset + standard_piece.width,
                y=gutter_y_offset + 0 * standard_piece.height})
  set_coords(gutter_icons.fortress, 1,
               {x=gutter_x_offset + standard_piece.width,
                y=gutter_y_offset + 1 * standard_piece.height})
  set_coords(gutter_icons.elephant, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 2 * standard_piece.height})
  set_coords(gutter_icons.dragon, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 3 * standard_piece.height})
  set_coords(gutter_icons.king, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 4 * standard_piece.height})
  set_coords(gutter_icons.rabble, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 5 * standard_piece.height})
  set_coords(gutter_icons.light_horse, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 6 * standard_piece.height})
  set_coords(gutter_icons.spearman, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 7 * standard_piece.height})
  set_coords(gutter_icons.archer, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 8 * standard_piece.height})
  set_coords(gutter_icons.heavy_horse, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 9 * standard_piece.height})
  set_coords(gutter_icons.trebuchet, 1,
               {x=gutter_x_offset + standard_piece.width,
                y= gutter_y_offset + 10 * standard_piece.height})
end

function init_gutter_icons()
  gutter_icons = {}

  -- Can't remember exactly what I was doing here, but it looks better
  -- sprite_locations = {}
  -- sprite_locations["Mountain"] = { gutter = { row=11 }, actual = { row=1 } }
  -- sprite_locations["Fortress"] = { gutter = { row=12 }, actual = { row=2 } }
  -- sprite_locations["Elephant"] = { gutter = { row=13 }, actual = { row=3 } }
  -- sprite_locations["Dragon"]   = { gutter = { row=14 }, actual = { row=4 } }
  -- sprite_locations["King"]     = { gutter = { row=15 }, actual = { row=5 } }
  -- sprite_locations["Rabble"]   = { gutter = { row=16 }, actual = { row=6 } }
  -- sprite_locations["Light Horse"] = { gutter = { row=17 }, actual = { row=7 } }
  -- sprite_locations["Spearman"] = { gutter = { row=18 }, actual = { row=8 } }
  -- sprite_locations["Archer"]   = { gutter = { row=19 }, actual = { row=9 } }
  -- sprite_locations["Heavy Horse"] = { gutter = { row=20 }, actual = { row=10 } }
  -- sprite_locations["Trebuchet"] = { gutter = { row=21 }, actual = { row=11 } }
  insert_icon(gutter_icons, "Mountain", 0, 11)
  insert_icon(gutter_icons, "Fortress", 1, 11)
  insert_icon(gutter_icons, "Elephant", 2, 11)
  insert_icon(gutter_icons, "Dragon", 3, 11)
  insert_icon(gutter_icons, "King", 4, 11)
  insert_icon(gutter_icons, "Rabble", 5, 11)
  insert_icon(gutter_icons, "Light Horse", 6, 11)
  insert_icon(gutter_icons, "Spearman", 7, 11)
  insert_icon(gutter_icons, "Archer", 8, 11)
  insert_icon(gutter_icons, "Heavy Horse", 9, 11)
  insert_icon(gutter_icons, "Trebuchet", 10, 11)

  set_icon_coords()
end

function set_coords(piece, player, coords)
  local current_piece = tablex.deepcopy(piece)
  current_piece.cubby_coords = coords
  current_piece.coords = tablex.copy(coords)
  current_piece.player = player
  table.insert(gutter_icons, current_piece)
end

function draw_gutter_icons()
  for i, p in ipairs(gutter_icons) do
    -- love.graphics.drawq( image, quad, x, y, r, sx, sy, ox, oy, kx, ky )
    -- love.graphics.draw( drawable, x, y, r, sx, sy, ox, oy, kx, ky )
    love.graphics.draw(sprites, p.quad, p.coords.x, p.coords.y, 0, .5, .5)
  end
end

function init_piece_from_gutter(gutter_icon)
  insert_icon(gutter_icons)
end