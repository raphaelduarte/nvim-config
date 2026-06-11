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

## Como ler os atalhos

A notação `<...>` é o jeito do Vim de escrever teclas especiais:

| Notação      | Tecla                                                         |
| ------------ | ------------------------------------------------------------ |
| `<leader>`   | A **tecla líder**. Nesta config é a **barra de espaço** (`<Espaço>`) |
| `<C-x>`      | **Ctrl + x**                                                 |
| `<M-x>`      | **Alt + x** (Meta)                                           |
| `<CR>`       | **Enter**                                                    |
| `<Espaço>u`  | Aperta **Espaço** e em seguida **u** (atalhos em sequência)  |

Os modos: **n** = normal, **v/x** = visual (texto selecionado), **t** = terminal.
Ou seja, `<leader>u` = aperta `Espaço` e depois `u` no modo normal.

> Dica: aperte só a `<Espaço>` e espere, o **which-key** abre um menu mostrando o que vem depois.

---

# Minhas customizações (o que NÃO é padrão do LazyVim)

## Comportamento

- **Auto-save**: salva o arquivo automaticamente ao sair do modo insert (`InsertLeave`).
- **Cursor sempre em bloco** (`guicursor=`).
- **Tema**: `tokyonight-moon`.
- **Linguagens ativadas** (`lazyvim.json`): Rust, TypeScript, Java, Go, Clojure, C#/OmniSharp, JSON.

## Atalhos gerais (`lua/config/keymaps.lua`)

| Atalho                      | Modo | O que faz                                                              |
| --------------------------- | ---- | --------------------------------------------------------------------- |
| `<C-a>`                     | n    | Seleciona o arquivo inteiro (`ggVG`)                                  |
| `:Web <url>` / `<leader>W`  | n    | Lê uma página web dentro do nvim via `lynx -dump` (buffer read-only). Sem URL, ele pergunta |
| `:Google ...` / `<leader>?` | n    | Googla a **palavra sob o cursor** e abre no browser gráfico            |
| `<leader>?`                 | v    | Googla o **texto selecionado**                                        |

> `:Web` precisa do `lynx` instalado. `:Google` usa `xdg-open` (abre seu browser padrão).

## Terminais flutuantes — toggleterm (`lua/plugins/toggleterm.lua`)

| Atalho                      | Modo | O que faz                              |
| --------------------------- | ---- | -------------------------------------- |
| `<C-\>`                     | n/t  | Abre/fecha o terminal flutuante        |
| `<leader>t1` … `<leader>t4` | n/t  | 4 terminais flutuantes independentes   |
| `<leader>tt`                | n/t  | Alterna todos os terminais abertos     |
| `<leader>th` / `<leader>tv` | n/t  | Terminal horizontal / vertical         |
| `<C-h/j/k/l>`               | t    | Navega entre janelas a partir do terminal |
| `<C-x>`                     | t    | Sai do modo terminal (volta pro normal)|

## File explorers — oil + mini.files (`oil.lua`, `mini.lua`)

| Atalho        | Modo | O que faz                                       |
| ------------- | ---- | ----------------------------------------------- |
| `-`           | n    | Abre o diretório pai como um buffer editável (oil) |
| `<leader>-`   | n    | Mesmo, mas em janela flutuante                  |
| `<leader>ee`  | n    | Abre o explorer do mini.files                   |
| `<leader>ef`  | n    | Abre o explorer já no arquivo atual             |

## Edição de texto — mini.nvim (`mini.lua`)

| Atalho            | Modo | O que faz                                         |
| ----------------- | ---- | ------------------------------------------------- |
| `sa` (ex: `saiw`) | n/v  | **Add** surround: envolve com aspas/parênteses/etc |
| `ds`              | n    | **Delete** surround: remove o par ao redor        |
| `sr`              | n    | **Replace** surround: troca o par (ex: `"` por `'`)|
| `sf` / `sF`       | n    | Acha o surround à direita / esquerda              |
| `sj` / `sk`       | n/x  | Junta / quebra argumentos em uma ou várias linhas |
| `<leader>cw`      | n    | Apaga espaços em branco no fim das linhas         |
| `gc` (do LazyVim) | n/v  | Comentar/descomentar (com suporte a TSX/JSX/HTML) |

## Busca — telescope (`telescope.lua`)

| Atalho        | Modo | O que faz                                      |
| ------------- | ---- | ---------------------------------------------- |
| `<leader>pr`  | n    | Arquivos abertos recentemente (oldfiles)       |
| `<leader>pWs` | n    | Procura no projeto a palavra sob o cursor      |
| `<leader>te`  | n    | Trocador de tema (com preview ao vivo)         |
| `<C-j>/<C-k>` | i    | Desce / sobe na lista de resultados            |

## Diagnósticos — trouble (`trouble.lua`)

| Atalho        | O que faz                                  |
| ------------- | ------------------------------------------ |
| `<leader>xw`  | Diagnósticos do workspace inteiro          |
| `<leader>xd`  | Diagnósticos só do arquivo atual           |
| `<leader>xq`  | Quickfix list                              |
| `<leader>xl`  | Location list                              |
| `<leader>xt`  | Lista os TODOs do código                   |

## Histórico e sessões

| Atalho        | O que faz                                   |
| ------------- | ------------------------------------------- |
| `<leader>u`   | Abre o **undotree** (árvore de desfazer)    |
| `<leader>wr`  | Restaura a sessão da pasta atual            |
| `<leader>ws`  | Salva a sessão da pasta atual               |

---

## Estrutura dos arquivos

- `lua/config/` — `options`, `keymaps`, `autocmds` (minhas customizações de base)
- `lua/plugins/` — plugins extras (oil, mini, telescope, toggleterm, trouble, undotree, auto-session, templ, lang)
- `lazyvim.json` — extras de linguagem ativados
- `lazy-lock.json` — versões dos plugins travadas

Para tudo que é padrão do LazyVim (busca de arquivos, LSP, git, etc.), veja a
[documentação oficial](https://lazyvim.github.io/keymaps).
