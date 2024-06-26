local M = {}

-- Function: Shows diff between yanked text (default register) with the visually selected text
function M.check_diff(start_line, end_line)
  -- Get the lines from the buffer
  local new_lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Join the lines with newline character to form a string and copy the text to register 't'
  vim.fn.setreg('t', table.concat(new_lines, "\n"))

  -- Get filetype of current buffer
  local ftype = vim.api.nvim_eval("&filetype")

  -- Create a new tab page and paste the original text
  vim.cmd("tabnew")
  vim.cmd("normal! P")
  vim.cmd("setlocal buftype=nowrite")
  vim.cmd("set filetype="..ftype)
  vim.cmd("diffthis")

  -- Create a new vertical split and paste the text from register 't'
  vim.cmd("vnew")
  vim.cmd("normal! \"tP")
  vim.cmd("setlocal buftype=nowrite")
  vim.cmd("set filetype="..ftype)
  vim.cmd("diffthis")
end

-- Function: Converts ASCII to Hex values
function M.ascii_to_hex()
  local start_pos, end_pos = vim.fn.getpos("'<"), vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selected_text = line:sub(start_pos[3], end_pos[3])
  local ascii_values = {}
  for i = 1, #selected_text do
    table.insert(ascii_values, string.format("%02X", string.byte(selected_text:sub(i, i))))
  end
  print("ASCII: " .. selected_text:gsub(".", "%1  ") .. "\nHex  : " .. table.concat(ascii_values, " "))
end

-- Function: Converts Hex values to ASCII
function M.hex_to_ascii()
  local start_pos, end_pos = vim.fn.getpos("'<"), vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selected_text = line:sub(start_pos[3], end_pos[3]):gsub("%s+", ""):gsub("0x", ""):gsub("_", "")
  local hex_values = {}
  local ascii_values = {}
  for i = 1, #selected_text, 2 do
    local hex_pair = selected_text:sub(i, i+1)
    table.insert(hex_values, hex_pair)
    table.insert(ascii_values, string.char(tonumber(hex_pair, 16)))
  end
  print("Hex  : " .. table.concat(hex_values, " ") .. "\nASCII: " .. table.concat(ascii_values, "  "))
end

-- Function: Converts Decimal number to Hexadecimal number
function M.dec_to_hex()
  local start_pos, end_pos = vim.fn.getpos("'<"), vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selected_text = line:sub(start_pos[3], end_pos[3]):gsub("%s+", ""):gsub("_", "")
  local dec_value = tonumber(selected_text)
  if dec_value then
    local hex_value = string.format("0x%X", dec_value)
    print("Dec: " .. dec_value .. "\nHex: " .. hex_value)
  else
    print("Error: Invalid decimal number")
  end
end

-- Function: Converts Hexadecimal number to Decimal Number
function M.hex_to_dec()
  local start_pos, end_pos = vim.fn.getpos("'<"), vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selected_text = line:sub(start_pos[3], end_pos[3]):gsub("%s+", ""):gsub("_", "")
  local hex_value = selected_text:match("^0x") and selected_text or "0x" .. selected_text
  local dec_value = tonumber(hex_value, 16)
  if dec_value then
    print("Hex: " .. hex_value .. "\nDec: " .. dec_value)
  else
    print("Error: Invalid hexadecimal number")
  end
end

return M
