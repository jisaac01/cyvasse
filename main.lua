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
    love.graphics.print("Cyvasse", 400, 10)


    -- board
    -- foreach hex, draw the hex
    multiplication_factor = 50
    line_length = 10
    colors = { {0, 0, 0}, {255, 255, 255}, {255, 0, 0} }

   for x=1,12 do
   	 for y=1,12 do
   	  if board[x][y] then
   	  	love.graphics.point(x * multiplication_factor, y * multiplication_factor)
-- print(math.mod(x, 3))
-- print(colors[math.mod(x, 3) + 1])
   	  	love.graphics.setColor(colors[math.mod(x, 3) + 1])

   	  	left_point = {}
   	  	left_point.x = x * multiplication_factor - multiplication_factor / 2
   	  	left_point.y = y * multiplication_factor

   	  	left_top = {}
   	  	left_top.x = x * multiplication_factor - multiplication_factor / 4
        left_top.y = y * multiplication_factor - multiplication_factor / 2

        left_bottom = {}
        left_bottom.x = x * multiplication_factor - multiplication_factor / 4
        left_bottom.y = y * multiplication_factor + multiplication_factor / 2

        right_top = {}
   	  	right_top.x = x * multiplication_factor + multiplication_factor / 4
        right_top.y = y * multiplication_factor - multiplication_factor / 2

        right_bottom = {}
        right_bottom.x = x * multiplication_factor + multiplication_factor / 4
        right_bottom.y = y * multiplication_factor + multiplication_factor / 2

        right_point = {}
   	  	right_point.x = x * multiplication_factor + multiplication_factor / 2
   	  	right_point.y = y * multiplication_factor

        love.graphics.polygon('fill', left_point.x, left_point.y, left_bottom.x, left_bottom.y, right_bottom.x, right_bottom.y, right_point.x, right_point.y, right_top.x, right_top.y,
        	                          left_top.x, left_top.y, left_point.x, left_point.y)
   	  end
   	 end
   end

end