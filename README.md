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

## O que tem aqui

- Base [LazyVim](https://github.com/LazyVim/LazyVim) com plugins extras em `lua/plugins/`
  (telescope, oil, toggleterm, trouble, undotree, auto-session, mini, templ, etc.)
- Customizações de `options`, `keymaps` e `autocmds` em `lua/config/`
- Versões dos plugins travadas em `lazy-lock.json`

Veja a [documentação do LazyVim](https://lazyvim.github.io/installation) para mais detalhes.
