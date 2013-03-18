function init_board()
  hex_height = 50
  hex_width_factor = .75

  color_counter = 1

  board = {}
  for x=1,13 do
    board[x] = {}

    if math.mod(x, 2) == 0 then
      color_counter = 2
    else
      color_counter = 3
    end

    for y=1,13 do
      coords = base_coords({x=x, y=y}, hex_height, hex_width_factor)

      if point_is_within_hexagon_borders(hex_height, hex_width_factor, coords) then
        board[x][y] = {}

        board[x][y].color = colors[math.mod(color_counter, 3) + 1]
        board[x][y].coords = coords

        board[x][y].left_point = {}
        board[x][y].left_point.x = coords.x - hex_height / 2
        board[x][y].left_point.y = coords.y

        board[x][y].left_top = {}
        board[x][y].left_top.x = coords.x - hex_height / 4
        board[x][y].left_top.y = coords.y - hex_height / 2

        board[x][y].left_bottom = {}
        board[x][y].left_bottom.x = coords.x - hex_height / 4
        board[x][y].left_bottom.y = coords.y + hex_height / 2

        board[x][y].right_top = {}
        board[x][y].right_top.x = coords.x + hex_height / 4
        board[x][y].right_top.y = coords.y - hex_height / 2

        board[x][y].right_bottom = {}
        board[x][y].right_bottom.x = coords.x + hex_height / 4
        board[x][y].right_bottom.y = coords.y + hex_height / 2

        board[x][y].right_point = {}
        board[x][y].right_point.x = coords.x + hex_height / 2
        board[x][y].right_point.y = coords.y
      end

      color_counter = color_counter + 1
    end
  end
end

function draw_board()
  -- foreach hex, draw the hex
  for x=1,13 do
    for y=1,13 do
      if board[x][y] then

        left_point   = board[x][y].left_point
        left_bottom  = board[x][y].left_bottom
        right_bottom = board[x][y].right_bottom
        right_point  = board[x][y].right_point
        right_top    = board[x][y].right_top
        left_top     = board[x][y].left_top
        left_point   = board[x][y].left_point

        love.graphics.setColor(board[x][y].color)
        love.graphics.polygon('fill', left_point.x, left_point.y, left_bottom.x, left_bottom.y, right_bottom.x, right_bottom.y,
                       right_point.x, right_point.y,
                       right_top.x, right_top.y,
                       left_top.x, left_top.y,
                       left_point.x, left_point.y)
        love.graphics.setColor({0,0,0})
        love.graphics.polygon('line', left_point.x, left_point.y, left_bottom.x, left_bottom.y,
                       right_bottom.x, right_bottom.y, right_point.x, right_point.y, right_top.x, right_top.y,
          left_top.x, left_top.y, left_point.x, left_point.y)

        love.graphics.setColor( 100, 100, 100 )
        love.graphics.print(x .. " " .. y, board[x][y].coords.x -10, board[x][y].coords.y)
      end
    end
  end
end

function point_is_within_hexagon_borders(hex_height, hex_width_factor, point)
  top = base_coords({ x=7, y=1 }, hex_height, hex_width_factor)
  right_top = base_coords({ x=13, y=4 }, hex_height, hex_width_factor)
  right_bottom = base_coords({ x=13, y=10 }, hex_height, hex_width_factor)
  bottom = base_coords({ x=7, y=13 }, hex_height, hex_width_factor)
  left_bottom = base_coords({ x=1, y=10 }, hex_height, hex_width_factor)
  left_top = base_coords({ x=1, y=4 }, hex_height, hex_width_factor)

  if is_left_of_line(top, right_top, point) and
     is_left_of_line(right_top, right_bottom, point) and
     is_left_of_line(right_bottom, bottom, point) and
     is_right_of_line(left_bottom, bottom, point) and
     is_right_of_line(left_top, left_bottom, point) and
     is_right_of_line(top, left_top, point) then
    return true
  else
    return false
  end
end

function gt_lt_line(point_a, point_b, point_c)
  return ((point_b.x - point_a.x) * (point_c.y - point_a.y) -
           (point_b.y - point_a.y) * (point_c.x - point_a.x))
end

function is_left_of_line(point_a, point_b, point_c)
  return gt_lt_line(point_a, point_b, point_c) >= 0
end

function is_right_of_line(point_a, point_b, point_c)
  return gt_lt_line(point_a, point_b, point_c) <= 0
end

function base_coords(point, hex_height, hex_width_factor)
  if math.mod(point.x,2) == 0 then
    vertical_offset = hex_height / 2
  else
    vertical_offset = 0
  end

  base_x = (point.x * hex_height * hex_width_factor)
  base_y = (point.y * hex_height) + vertical_offset
  return {x=base_x, y=base_y}
end

