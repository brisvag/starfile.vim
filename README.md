# starfile.vim

A syntax file for vim for the relion (and others) `.star` file format. It highlights each column and header differently, in a way that makes easier to spot specific columns in the sea of characters.

![vim screenshot](https://github.com/brisvag/starfile.vim/assets/23482191/a6a4cffe-60f4-40a3-b907-273f47d97c28)

For it to work, your `vim` needs to have (in your `~/.vimrc` for persistance):

```vim
set filetype syntax indent plugin
```

Then, edit your [`filetype.vim` file](https://vim.fandom.com/wiki/Filetype.vim#File_locations) so it contains something like this:

```vim
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.star setfiletype starfile
augroup END
```
