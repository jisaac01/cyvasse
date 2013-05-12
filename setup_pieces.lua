function init_setup_icons()
  setup_pieces = {}

  standard_setup_piece = {
    height = 64,
    width = 64
  }

  insert_prototype("Mountain", 0)
  insert_prototype("Fortress", 1)
  insert_prototype("Elephant", 2)
  insert_prototype("Dragon", 3)
  insert_prototype("King", 4)
  insert_prototype("Rabble", 5)
  insert_prototype("Light Horse", 6)
  insert_prototype("Spearman", 7)
  insert_prototype("Archer", 8)
  insert_prototype("Heavy Horse", 9)
  insert_prototype("Trebuchet", 10)

print(pretty.write(setup_pieces))
end

local function insert_prototype(name, sprite_order)
  local number_of_pieces = 11

  local this_piece = tablex.deepcopy(standard_setup_piece)
  this_piece.name = name
  this_piece.quad = love.graphics.newQuad(
    0, number_of_pieces + sprite_order * standard_piece.height + 1, -- start x, y of sprite
    standard_piece.width, standard_piece.height, -- width, height of each sprite
    64, 1408) -- width, height of sprite file
  id = string.lower(name)
  id = string.gsub(id, " ", "_")
  setup_pieces[id] = this_piece
end

function init_pieces()
  pieces = {}

  insert_piece(piece_prototypes.mountain, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y=gutter_y_offset + 0 * standard_piece.height})
  insert_piece(piece_prototypes.fortress, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y=gutter_y_offset + 1 * standard_piece.height})
  insert_piece(piece_prototypes.elephant, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 2 * standard_piece.height})
  insert_piece(piece_prototypes.dragon, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 3 * standard_piece.height})
  insert_piece(piece_prototypes.king, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 4 * standard_piece.height})
  insert_piece(piece_prototypes.rabble, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 5 * standard_piece.height})
  insert_piece(piece_prototypes.light_horse, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 6 * standard_piece.height})
  insert_piece(piece_prototypes.spearman, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 7 * standard_piece.height})
  insert_piece(piece_prototypes.archer, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 8 * standard_piece.height})
  insert_piece(piece_prototypes.heavy_horse, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 9 * standard_piece.height})
  insert_piece(piece_prototypes.trebuchet, 1,
               {x=gutter_x_offset + 2 * standard_piece.width,
                y= gutter_y_offset + 10 * standard_piece.height})

end

function insert_piece(piece, player, coords)
  local current_piece = tablex.deepcopy(piece)
  current_piece.cubby_coords = coords
  current_piece.coords = tablex.copy(coords)
  current_piece.player = player
  table.insert(pieces, current_piece)
end


function draw_pieces()

  for i, p in ipairs(pieces) do
    if p.dragging.active then
      p.coords.x = love.mouse.getX() - p.dragging.diffX
      p.coords.y = love.mouse.getY() - p.dragging.diffY
    end

    love.graphics.drawq(sprites, p.quad, p.coords.x, p.coords.y, 0, .5, .5)
  end
end
