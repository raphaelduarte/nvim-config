# 💤 Neovim Config (LazyVim)

Minha configuração pessoal do Neovim, baseada no [LazyVim](https://github.com/LazyVim/LazyVim).

## Instalação

### macOS (passo a passo)

Pré-requisito: ter o [Homebrew](https://brew.sh) instalado. Se não tiver, rode:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**1. Instale o Neovim e as dependências:**

```sh
# Neovim + ferramentas que esta config usa
brew install neovim git ripgrep fd lazygit lynx

# Fonte com ícones (necessária pra ver os ícones do explorer/statusline)
brew install --cask font-jetbrains-mono-nerd-font
```

> Depois de instalar a fonte, configure o seu terminal (iTerm2, Terminal.app,
> Ghostty, etc.) pra usar **"JetBrainsMono Nerd Font"**, senão os ícones viram quadradinhos.

**2. Faça backup de qualquer config antiga do Neovim** (pula se nunca usou):

```sh
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
```

**3. Clone esta config:**

```sh
git clone https://github.com/raphaelduarte/nvim-config ~/.config/nvim
```

**4. Abra o Neovim:**

```sh
nvim
```

Na primeira vez o LazyVim baixa e instala todos os plugins sozinho (leva 1-2 min).
Quando terminar, feche (`:q`) e abra de novo. Pronto.

> **Suporte a linguagens (opcional):** esta config ativa extras de Rust, TypeScript,
> Java, Go, Clojure, C#/.NET e JSON. Os servidores de LSP são instalados
> automaticamente pelo Mason, mas eles precisam que a linguagem em si esteja
> instalada na máquina. Instale só o que for usar, por exemplo:
> `brew install node go rust openjdk` (e `dotnet` via cask pra C#).

### Linux

Mesma ideia, trocando o gerenciador de pacotes. Ex. no Debian/Ubuntu:

```sh
sudo apt install neovim git ripgrep fd-find lazygit lynx
# + instale uma Nerd Font manualmente e configure no terminal
git clone https://github.com/raphaelduarte/nvim-config ~/.config/nvim
nvim
```

### Plano B: Mac da empresa (sem admin / com restrições)

Em máquina corporativa o `brew install` pode falhar por falta de permissão de
admin, ou a empresa pode bloquear instalar fontes. Dá pra contornar:

**Homebrew sem admin** (instala na sua pasta de usuário, não precisa de sudo):

```sh
# instala o brew em ~/.homebrew em vez de /opt/homebrew
mkdir -p ~/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master \
  | tar xz --strip-components 1 -C ~/.homebrew

# deixa o brew disponível no shell (adicione também ao seu ~/.zshrc)
eval "$(~/.homebrew/bin/brew shellenv)"

# agora instala normalmente
brew install neovim git ripgrep fd lazygit lynx
```

> Se nem isso for possível, dá pra baixar o Neovim como binário avulso (sem
> instalar nada): pegue o `nvim-macos-*.tar.gz` em
> https://github.com/neovim/neovim/releases, descompacte e rode o `bin/nvim`
> de dentro da pasta. O `ripgrep` e o `fd` também têm binários soltos nos
> releases deles.

**Rodar sem Nerd Font** (se a empresa bloquear instalar fontes): a config
funciona normalmente, só os ícones ficam como quadradinhos. Pra esconder os
ícones em vez de mostrar quadrados, crie o arquivo
`~/.config/nvim/lua/plugins/no-nerd-font.lua` com:

```lua
return {
  { "LazyVim/LazyVim", opts = { icons = { kinds = {} } } },
}
```

E no terminal use uma fonte monoespaçada qualquer (Menlo, Monaco, SF Mono).

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
