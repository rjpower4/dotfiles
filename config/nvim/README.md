# Neovim Configuration

## References

- Many of the decisions made in this configuration are inspired by those found in [kristijanhusak's configuration](https://github.com/kristijanhusak/neovim-config).

## Installation

To install, install [`vim-plug`](https://github.com/junegunn/vim-plug), clone this configuration to the neovim config directory:

```sh
git clone git@github.com:rjpower4/neovim-config ~/.config/nvim
```

open neovim and run `:PlugInstall`.

## Features

- Enhanced commenting via [`vim-commentary`](https://github.com/tpope/vim-commentary)
- Surround editing via [`vim-sandwich`](https://github.com/machakann/vim-sandwich)
- Git porcelain via [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
- Enhanced star searching via [`haya14busa/vim-asterisk`](https://github.com/haya14busa/vim-asterisk) and [`osyo-manga/vim-anzu`](https://github.com/osyo-manga/vim-anzu)
- Fuzzy finding via [`junegunn/fzf`](https://github.com/junegunn/fzf)
- Jumping via [`pechorin/any-jump.vim`](https://github.com/pechorin/any-jump.vim) and [`unblevable/quick-scope`](https://github.com/unblevable/quick-scope)
- Slime via [`jpalardy/vim-slime`](https://github.com/jpalardy/vim-slime)
- Julia programming via [`JuliaEditorSupport/julia-vim`](https://github.com/JuliaEditorSupport/julia-vim)
- Go programming via [`fatih/vim-go`](https://github.com/fatih/vim-go)

## Notable Key Mappings

|     Mapping     |       Description        |
| :-------------: | :----------------------: |
|       `,`       |        Leader Key        |
|   `<Leader>g`   | Open vertical git split  |
|   `<Leader>c`   |         Comment          |
|   `<Leader>v`   |      Vertical Split      |
|   `<Leader>s`   |     Horizontal Split     |
|   `<Leader>f`   |  Open fuzzy file finder  |
|   `<Leader>b`   | Open fuzzy buffer finder |
| `<Leader><tab>` |  Toggle between buffers  |
