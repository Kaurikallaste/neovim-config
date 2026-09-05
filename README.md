## For my sanity

to .bashrc

```sh
alias vim="nvim"
alias vi="nvim"
```

```git pull``` and copy to  ```~/.config/nvim/```

## Deps
```sh
tree-sitter-cli > 0.25 install with npm
neovim > 0.12
go + gopls
rust + rust-analyzer
nvm, node, typescript installed globally
ripgrep
```

### Rust LSP

Install the language server for the active Rust toolchain:

```sh
rustup component add rust-analyzer
```

Restart Neovim after installation, open a Rust file, and run `:LspInfo` to
confirm that `rust_analyzer` is attached.
