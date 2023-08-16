# starfile.vim

A syntax file for vim for the relion (and others) `.star` file format. It highlights each column and header differently, in a way that makes easier to spot specific columns in the sea of characters. This is especially useful with many headers wrapping over multiple lines or continuing off the screen where it's hard to count columns.

![vim screenshot](https://user-images.githubusercontent.com/23482191/261008259-40055c19-5e81-4e8f-928c-c642086c1d6b.png)

_The colorscheme used above is [gruvbox-dark](https://github.com/gruvbox-community/gruvbox), but it should work well with the builtin colorschemes._

For it to work, your `vim` needs to have the following settings active (in your `~/.vimrc` for persistence):

```vim
filetype plugin indent on
syntax on
```

Then, create or edit your [`filetype.vim` file](https://vim.fandom.com/wiki/Filetype.vim#File_locations) (likely inside `$HOME/.vim/`) so it contains something like this:

```vim
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.star setfiletype starfile
augroup END
```
