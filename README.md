# starfile.vim

A syntax file for vim for the STAR (Self-defining Text Archive and Retrieval) format (the underlying format behind the `PDBx/mmCIF/CIF` molecular structure files from [the PDB](https://www.rcsb.org/), the [`.star` files used by `RELION`](https://relion.readthedocs.io/en/release-3.1/Reference/Conventions.html#star-format), and a few others).

It highlights each column and header differently, in a way that makes easier to match specific columns to their headers in the otherwise inscrutable sea of characters. This is especially useful with many headers wrapping over multiple lines or continuing off the screen where it's hard to count columns.

![vim screenshot](https://user-images.githubusercontent.com/23482191/261008259-40055c19-5e81-4e8f-928c-c642086c1d6b.png)

_The colorscheme used above is [gruvbox-dark](https://github.com/gruvbox-community/gruvbox), but it should work well with the builtin colorschemes._

For syntax highlighting to work, your `vim` needs to have the following settings active (in your `~/.vimrc` for persistence):

```vim
filetype plugin indent on
syntax on
```

Then, create or edit your [`filetype.vim` file](https://vim.fandom.com/wiki/Filetype.vim#File_locations) (likely inside `~/.vim/`) so it contains something like this:

```vim
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.star,*.cif setfiletype starfile
augroup END
```

This will automatically detect the file extension and load the correct syntax file whenever you open a `.star` file.

Finally, put the [`starfile.vim`](./starfile.vim) provided here inside the [`syntax` vim runtime directory]() (likely `~/.vim/syntax/`) and everything should work.

### Neovim

If you're on `nvim`, the aforementioned paths should all be inside `.config/nvim/`.

### Known issues

- if there's a newline between columns that belongs to the same line in a `_loop` construct (which is weird, but alas allowed in STAR), colors will be mismatched. This is because with the limited vim `syntax` we can't distinguish between a new line of columns or just the next column on a new line.

---

License is GPLv3; feel **free** to contribute and fork!
