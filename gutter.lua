function draw_gutter()
  love.graphics.setColor(white)
  love.graphics.line(gutter_x_offset, gutter_y_offset, gutter_x_offset, love.graphics.getHeight())
  love.graphics.setColor( black )
  love.graphics.print("Player 1", gutter_x_offset, gutter_y_offset)
  love.graphics.print("Player 2", gutter_x_offset, gutter_y_offset + window_height / 2)
end
