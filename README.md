# starfile.vim

A syntax file for vim for the relion (and others) `.star` file format. It highlights each column and header differently, in a way that makes easier to spot specific columns in the sea of characters.

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
