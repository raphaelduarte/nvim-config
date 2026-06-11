-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.cmd([[map <C-a> ggVG ]])

-- Ler páginas da web dentro do nvim (via lynx -dump) num buffer só de leitura
local function web_read(url)
  if not url or url == "" then
    url = vim.fn.input("URL: ", "https://")
  end
  if url == "" or url == "https://" then
    return
  end
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.bo.filetype = "markdown"
  vim.api.nvim_buf_set_name(0, "web://" .. url)
  local out = vim.fn.systemlist({ "lynx", "-dump", "-nolist", "-width=100", url })
  if vim.v.shell_error ~= 0 then
    out = { "Falha ao carregar: " .. url, "" }
    vim.list_extend(out, vim.fn.systemlist({ "lynx", "-dump", "-width=100", url }))
  end
  vim.api.nvim_buf_set_lines(0, 0, -1, false, out)
  vim.bo.modifiable = false
  vim.cmd("normal! gg")
end

vim.api.nvim_create_user_command("Web", function(opts)
  web_read(opts.args)
end, { nargs = "?", desc = "Ler URL no buffer via lynx" })

-- <leader>W pergunta a URL; ou rode :Web https://...
vim.keymap.set("n", "<leader>W", function()
  web_read(nil)
end, { desc = "Web reader (lynx)" })

-- Googlar de dentro do nvim: abre a busca no browser GRÁFICO de verdade (Chrome)
local function urlencode(str)
  return (str:gsub("[^%w%-_%.~]", function(c)
    return string.format("%%%02X", string.byte(c))
  end))
end

local function google(query)
  if not query or query == "" then
    query = vim.fn.input("Google: ")
  end
  if query == "" then
    return
  end
  local url = "https://www.google.com/search?q=" .. urlencode(query)
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
  vim.notify("Googlando: " .. query)
end

vim.api.nvim_create_user_command("Google", function(opts)
  google(opts.args)
end, { nargs = "?", desc = "Buscar no Google (abre no browser)" })

-- <leader>? googla a palavra sob o cursor; ou rode :Google seus termos
vim.keymap.set("n", "<leader>?", function()
  google(vim.fn.expand("<cword>"))
end, { desc = "Google: palavra sob o cursor" })
-- modo visual: googla a seleção
vim.keymap.set("v", "<leader>?", function()
  vim.cmd('normal! "zy')
  google(vim.fn.getreg("z"))
end, { desc = "Google: seleção" })
