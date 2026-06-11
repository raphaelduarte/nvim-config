return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
      },
    })

    -- Função para criar terminais específicos
    local Terminal = require("toggleterm.terminal").Terminal

    -- Terminal 1
    local term1 = Terminal:new({
      count = 1,
      direction = "float",
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    -- Terminal 2
    local term2 = Terminal:new({
      count = 2,
      direction = "float",
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    -- Terminal 3
    local term3 = Terminal:new({
      count = 3,
      direction = "float",
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    -- Terminal 4
    local term4 = Terminal:new({
      count = 4,
      direction = "float",
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    -- Funções para toggle dos terminais
    _G.toggle_term1 = function()
      term1:toggle()
    end

    _G.toggle_term2 = function()
      term2:toggle()
    end

    _G.toggle_term3 = function()
      term3:toggle()
    end

    _G.toggle_term4 = function()
      term4:toggle()
    end

    -- Keymaps para os terminais
    vim.keymap.set({ "n", "t" }, "<leader>t1", "<cmd>lua toggle_term1()<CR>", { desc = "Toggle Terminal 1" })
    vim.keymap.set({ "n", "t" }, "<leader>t2", "<cmd>lua toggle_term2()<CR>", { desc = "Toggle Terminal 2" })
    vim.keymap.set({ "n", "t" }, "<leader>t3", "<cmd>lua toggle_term3()<CR>", { desc = "Toggle Terminal 3" })
    vim.keymap.set({ "n", "t" }, "<leader>t4", "<cmd>lua toggle_term4()<CR>", { desc = "Toggle Terminal 4" })

    -- Atalho para alternar entre todos os terminais abertos
    vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>ToggleTermToggleAll<CR>", { desc = "Toggle All Terminals" })

    -- Atalho para navegar entre terminais
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Navigate to left window from terminal" })
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Navigate to down window from terminal" })
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Navigate to up window from terminal" })
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Navigate to right window from terminal" })

    -- Atalho para sair do modo terminal
    vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

    -- Atalhos específicos por número
    vim.keymap.set({ "n", "t" }, "<leader>1t", "<cmd>1ToggleTerm<CR>", { desc = "Toggle Terminal 1 by ID" })
    vim.keymap.set({ "n", "t" }, "<leader>2t", "<cmd>2ToggleTerm<CR>", { desc = "Toggle Terminal 2 by ID" })
    vim.keymap.set({ "n", "t" }, "<leader>3t", "<cmd>3ToggleTerm<CR>", { desc = "Toggle Terminal 3 by ID" })
    vim.keymap.set({ "n", "t" }, "<leader>4t", "<cmd>4ToggleTerm<CR>", { desc = "Toggle Terminal 4 by ID" })

    -- Terminal horizontal e vertical
    vim.keymap.set(
      { "n", "t" },
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { desc = "Toggle Horizontal Terminal" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical<CR>",
      { desc = "Toggle Vertical Terminal" }
    )
  end,
}
