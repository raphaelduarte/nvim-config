# 💤 Neovim Config (LazyVim)

Minha configuração pessoal do Neovim, baseada no [LazyVim](https://github.com/LazyVim/LazyVim).

## Instalação

Faça backup da sua config atual e clone esta:

```sh
# backup
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# clonar
git clone https://github.com/raphaelduarte/nvim-config ~/.config/nvim

# abrir (o LazyVim instala os plugins automaticamente)
nvim
```

## Comportamento custom

- **Auto-save**: salva o arquivo automaticamente ao sair do modo insert (`InsertLeave`).
- **Cursor em bloco** sempre (`guicursor=`).
- Tema: `tokyonight-moon`.

## Comandos e atalhos próprios

| Atalho / comando            | O que faz                                                        |
| --------------------------- | ---------------------------------------------------------------- |
| `<C-a>`                     | Seleciona o arquivo inteiro (`ggVG`)                             |
| `:Web <url>` / `<leader>W`  | Lê uma página web dentro do nvim via `lynx -dump` (buffer markdown read-only) |
| `:Google ...` / `<leader>?` | Googla a palavra sob o cursor (ou a seleção) abrindo no browser  |
| `<leader>t1`..`t4`          | 4 terminais flutuantes nomeados (toggleterm)                    |
| `<leader>th` / `<leader>tv` | Terminal horizontal / vertical                                  |
| `<leader>u`                 | Undotree                                                         |
| `<leader>ee`                | File explorer (mini.files)                                       |
| `-`                         | Abre o diretório pai (oil.nvim)                                  |
| `<leader>x*`                | Trouble (diagnostics / quickfix / todos)                        |
| `<leader>wr` / `<leader>ws` | Restaurar / salvar sessão (auto-session)                        |

> `:Web` precisa do `lynx` instalado; `:Google` usa `xdg-open` (browser gráfico).

## Estrutura

- `lua/config/` — `options`, `keymaps`, `autocmds` customizados
- `lua/plugins/` — plugins extras (oil, mini, telescope, toggleterm, trouble, undotree, auto-session, templ, lang)
- `lazyvim.json` — extras de linguagem ativados (Rust, TypeScript, Java, Go, Clojure, C#/OmniSharp, JSON)
- `lazy-lock.json` — versões dos plugins travadas

Veja a [documentação do LazyVim](https://lazyvim.github.io/installation) para mais detalhes.
