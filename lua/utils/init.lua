local M = {}

-- servers supported by Mason
M.mason_servers = {
  "lua_ls@3.7.0",
  "pyright@1.1.325",
  -- "bashls@5.0.0",
  "clangd@18.1.3",
}

-- servers not supported by Mason
M.other_servers = {
  -- "ccls",
}

M.all_servers = {}
for _, server in ipairs(M.mason_servers) do
  table.insert(M.all_servers, server)
end
for _, server in ipairs(M.other_servers) do
  table.insert(M.all_servers, server)
end

return M
