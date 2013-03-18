require 'board'

function love.load()
  love.graphics.setCaption( "Cyvasse" )
  love.graphics.setMode( 525, 700 )

  black = {0,0,0}
  white = {255,255,255}
  red   = {255,0,0}
  colors = { white, red, black }

  init_board()
end

function love.draw()
    love.graphics.setBackgroundColor( 100, 100, 100 )
    draw_board()
end

