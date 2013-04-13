function init_piece_prototypes()
  piece_prototypes = {}

  local standard_piece = {
    dragging = { active = false, diffX = 0, diffY = 0 },
    height = 64,
    width = 64
  }

  local elephant = tablex.deepcopy(standard_piece)
  elephant.name = "Elephant"
  elephant.quad = love.graphics.newQuad(0, 0, 64, 64, 64, 128)
  piece_prototypes.elephant = elephant

  local mountain = tablex.deepcopy(standard_piece)
  mountain.name = "Mountain"
  mountain.quad = love.graphics.newQuad(0, 65, 64, 64, 64, 128)
  piece_prototypes.mountain = mountain
end

function init_pieces()
  pieces = {}

  local mountain = tablex.deepcopy(piece_prototypes.mountain)
  mountain.cubby_coords = {x=1,y=2}
  mountain.coords = {x=1, y=2}
  mountain.player = 1
  table.insert(pieces, mountain)

  local elephant = tablex.deepcopy(piece_prototypes.elephant)
  elephant.cubby_coords = {x=gutter_x_offset + 2 * elephant.width,y=2}
  elephant.coords = {x=gutter_x_offset + 2 * elephant.width,y=2}
  elephant.player = 1
  table.insert(pieces, elephant)
end



function draw_pieces()

  for i, p in ipairs(pieces) do
    if p.dragging.active then
      p.coords.x = love.mouse.getX() - p.dragging.diffX
      p.coords.y = love.mouse.getY() - p.dragging.diffY
    end

    love.graphics.drawq(sprites, p.quad, p.coords.x, p.coords.y)
  end
end
