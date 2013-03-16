function love.load()
   -- image = love.graphics.newImage("cake.jpg")
   -- board = Board.new()
   board = {}
   for x=1,12 do
   	 board[x] = {}
   	 for y=1,12 do
   	   board[x][y] = true
   	 end
   end

end

function love.draw()
    love.graphics.setBackgroundColor( 100, 100, 100 )
    love.graphics.print("Cyvasse", 400, 10)
    draw_board()
end

function draw_board()

  hex_height = 50
  line_length = 10
  black = {0,0,0}
  white = {255,255,255}
  red   = {255,0,0}
  colors = { white, red, black }
  color_counter = 1

  -- foreach hex, draw the hex
  for x=1,12 do
    if math.mod(x, 2) == 0 then
      color_counter = 2
    else
      color_counter = 3
    end

    for y=1,12 do
      if board[x][y] then
        -- print(math.mod(x, 3))
        -- print(colors[math.mod(x, 3) + 1])
        love.graphics.setColor(colors[math.mod(color_counter, 3) + 1])
        color_counter = color_counter + 1

        if math.mod(x,2) == 0 then
          vertical_offset = hex_height / 2
        else
          vertical_offset = 0
        end

        base_x = (x * hex_height * .75)
        base_y = (y * hex_height) + vertical_offset

        left_point = {}
        left_point.x = base_x - hex_height / 2
        left_point.y = base_y

        left_top = {}
        left_top.x = base_x - hex_height / 4
        left_top.y = base_y - hex_height / 2

        left_bottom = {}
        left_bottom.x = base_x - hex_height / 4
        left_bottom.y = base_y + hex_height / 2

        right_top = {}
        right_top.x = base_x + hex_height / 4
        right_top.y = base_y - hex_height / 2

        right_bottom = {}
        right_bottom.x = base_x + hex_height / 4
        right_bottom.y = base_y + hex_height / 2

        right_point = {}
        right_point.x = base_x + hex_height / 2
        right_point.y = base_y

        love.graphics.polygon('fill', left_point.x, left_point.y, left_bottom.x, left_bottom.y, right_bottom.x, right_bottom.y, right_point.x, right_point.y, right_top.x, right_top.y,
          left_top.x, left_top.y, left_point.x, left_point.y)

        love.graphics.setColor( 100, 100, 100 )
        love.graphics.print(x .. " " .. y, base_x -10, base_y)
      end
    end
  end
end