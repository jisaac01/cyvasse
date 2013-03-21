function init_piece_prototypes()
  piece_prototypes = {}

  local elephant = {}
  elephant.quad = love.graphics.newQuad(0, 0, 64, 64, 64, 128)
  piece_prototypes.elephant = elephant

  local mountain = {}
  mountain.quad = love.graphics.newQuad(0, 65, 64, 64, 64, 128)
  piece_prototypes.mountain = mountain
end

function init_pieces()
  pieces = {}

  local mountain = table.copy(piece_prototypes.mountain)
  mountain.cubby_coords = {1,2}
  mountain.player = 1
  table.insert(pieces, mountain)

  local elephant = table.copy(piece_prototypes.elephant)
  elephant.cubby_coords = {2,2}
  elephant.player = 1
  table.insert(pieces, elephant)
end

function draw_pieces()
  for i, piece in ipairs(pieces) do
    love.graphics.drawq(sprites, piece.quad, 50 * i, 50)
  end
end
