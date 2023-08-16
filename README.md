# starfile.vim

A syntax file for vim for the STAR (Self-defining Text Archive and Retrieval) format (the underlying format behind the `PDBx/mmCIF/CIF` molecular structure files from [the PDB](https://www.rcsb.org/), the [`.star` files used by `RELION`](https://relion.readthedocs.io/en/release-3.1/Reference/Conventions.html#star-format), and a few others).

It highlights each column and header differently, in a way that makes easier to match specific columns to their headers in the otherwise inscrutable sea of characters. This is especially useful with many headers wrapping over multiple lines or continuing off the screen where it's hard to count columns.

![vim screenshot](https://user-images.githubusercontent.com/23482191/261008259-40055c19-5e81-4e8f-928c-c642086c1d6b.png)

_The colorscheme used above is [gruvbox-dark](https://github.com/gruvbox-community/gruvbox), but it should work well with the builtin colorschemes._

For it to work, your `vim` needs to have the following settings active (in your `~/.vimrc` for persistence):

```vim
set filetype syntax indent plugin
```

Then, create or edit your [`filetype.vim` file](https://vim.fandom.com/wiki/Filetype.vim#File_locations) (likely inside `$HOME/.vim/`) so it contains something like this:

```vim
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.star,*.cif setfiletype starfile
augroup END
```
