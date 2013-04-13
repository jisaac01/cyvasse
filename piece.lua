local function current_coords(piece)
  piece.current_coords = piece.current_coords or piece.cubby_coords
  return piece.current_coords
end

piece = {
  current_coords = current_coords
}

return piece