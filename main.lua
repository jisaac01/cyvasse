require 'board'

function love.load()
  love.graphics.setCaption( "Cyvasse" )
  love.graphics.setMode( 525, 700 )

  sprites = love.graphics.newImage("images/sprites.png")


  black = {0,0,0}
  white = {255,255,255}
  red   = {255,0,0}
  colors = { white, red, black }

  init_board()
  init_piece_prototypes()
  init_pieces()
end

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

  table.insert(pieces, table.copy(piece_prototypes.elephant))
  table.insert(pieces, table.copy(piece_prototypes.mountain))
end

function table.copy(t)
  local new_table = {}
  for k,v in pairs(t) do
    new_table[k] = v
  end
  return new_table
end

function draw_pieces()
  for i, piece in ipairs(pieces) do
    love.graphics.drawq(sprites, piece.quad, 50 * i, 50)
  end
end

function love.draw()
    love.graphics.setBackgroundColor( 100, 100, 100 )
    draw_board()
    draw_pieces()
end

