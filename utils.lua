function table.copy(t)
  local new_table = {}
  for k,v in pairs(t) do
    new_table[k] = v
  end
  return new_table
end
