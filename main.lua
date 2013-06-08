require 'utils'
require 'board'
require 'pieces'
require 'gutter_icons'
require 'gutter'

function love.load()
  sprites = love.graphics.newImage("images/sprites.png")

  black = {0,0,0}
  white = {255,255,255}
  red   = {255,0,0}
  grey  = {100,100,100}
  colors = { white, red, black }

  init_window()
  init_board()

  init_gutter_icons()
  init_piece_prototypes()
  init_pieces()
  draggable_pieces = {gutter_icons, pieces}
end

function init_window()
  hex_height = 50
  hex_width_factor = .75

  board_x_offset = hex_height / 2
  board_y_offset = hex_height * hex_width_factor / 2
  board_width = hex_height * 13 * hex_width_factor + 2 * board_x_offset
  board_height = hex_height * 13 + 2 * board_y_offset

  gutter_x_offset = board_width
  gutter_y_offset = 0
  gutter_width = hex_height * 4

  window_height = board_height
  window_width = board_width + gutter_width

  love.graphics.setCaption( "Cyvasse" )
  love.graphics.setMode( window_width, window_height )

  current_draggable = nil
end

function love.draw()
    love.graphics.setBackgroundColor(grey)
    draw_board()
    draw_gutter()
    draw_pieces()
end

function love.mousepressed(x, y, button)

  if button == "l" then
    for j, d in ipairs(draggable_pieces) do
      for i, p in ipairs(d) do

        if current_draggable == nil
          and x > p.coords.x and x < p.coords.x + p.width
          and y > p.coords.y and y < p.coords.y + p.height
        then
          p.dragging.active = true
          p.dragging.diffX = x - p.coords.x
          p.dragging.diffY = y - p.coords.y
          current_draggable = p
        end
      end
    end
  end

end

function love.mousereleased(x, y, button)
  if button == "l" then
    for i, p in ipairs(pieces) do
      p.dragging.active = false
      current_draggable = nil
    end
  end
end
