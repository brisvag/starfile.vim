" Vim syntax file
" Language:     STAR file (Relion, mmCIF, ..)
" Maintainer:   Lorenzo Gaifas <brisvag@gmail.com>
" License:      GPLv3
" URL:          https://github.com/brisvag/starfile.vim

" inspired by:
" - https://github.com/mechatroner/rainbow_csv
" - https://www.vim.org/scripts/script.php?script_id=4139
"
" syntax is defined for just 8 columns because most terminals (and
" colorschemes) only use 8 base colors.

" TODO: list, table, nested loops, ...

if exists("b:current_syntax")
  finish
endif

" TODO: folding not working :(
"syn region starFold start="loop_" end="PDB" transparent fold

" we need context for it to work correctly, so we brute force the syntax checking
" from the start of the file
syn sync fromstart

" first we deal with loops
" priority goes to last, which then gives priority to the one just above
" each column will try to match the next column (inside loop)
syn match column7 "\s*\S\+" nextgroup=column0 contains=@starField skipwhite
syn match column6 "\s*\S\+" nextgroup=column7 contains=@starField skipwhite
syn match column5 "\s*\S\+" nextgroup=column6 contains=@starField skipwhite
syn match column4 "\s*\S\+" nextgroup=column5 contains=@starField skipwhite
syn match column3 "\s*\S\+" nextgroup=column4 contains=@starField skipwhite
syn match column2 "\s*\S\+" nextgroup=column3 contains=@starField skipwhite
syn match column1 "\s*\S\+" nextgroup=column2 contains=@starField skipwhite
syn match column0 "\s*\S\+" nextgroup=column1 contains=@starField skipwhite
" same thing for headers
syn match header7 "\<_\S\+.*$" nextgroup=header0 contains=@starField skipwhite
syn match header6 "\<_\S\+.*$" nextgroup=header7 contains=@starField skipwhite
syn match header5 "\<_\S\+.*$" nextgroup=header6 contains=@starField skipwhite
syn match header4 "\<_\S\+.*$" nextgroup=header5 contains=@starField skipwhite
syn match header3 "\<_\S\+.*$" nextgroup=header4 contains=@starField skipwhite
syn match header2 "\<_\S\+.*$" nextgroup=header3 contains=@starField skipwhite
syn match header1 "\<_\S\+.*$" nextgroup=header2 contains=@starField skipwhite
syn match header0 "\<_\S\+.*$" nextgroup=header1 contains=@starField skipwhite

" inlined data entries are similar to headers, but we need to ensure we
" include multiline ;string; when found
syn region inline_data_entry7 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry0 contains=@starField skipwhite
syn region inline_data_entry6 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry7 contains=@starField skipwhite
syn region inline_data_entry5 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry6 contains=@starField skipwhite
syn region inline_data_entry4 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry5 contains=@starField skipwhite
syn region inline_data_entry3 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry4 contains=@starField skipwhite
syn region inline_data_entry2 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry3 contains=@starField skipwhite
syn region inline_data_entry1 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry2 contains=@starField skipwhite
syn region inline_data_entry0 start="\<_\S\+\s\+" skip="#" end=".*\n\(;\)\?" nextgroup=inline_data_entry1 contains=@starField skipwhite

" all possible string types (' " ''' """ ;)
syn region starString0 start=|^;|              skip=|#.*$| end=|^;|              contained contains=@Spell transparent extend
syn region starString1 start=|\(^\|\s\)\zs"|   skip=|\\"|  end=|"\ze\(\s\|$\)|   contained contains=@Spell transparent extend
syn region starString2 start=|\(^\|\s\)\zs"""| skip=|\\"|  end=|"""\ze\(\s\|$\)| contained contains=@Spell transparent extend
syn region starString3 start=|\(^\|\s\)\zs'|   skip=|\\'|  end=|'\ze\(\s\|$\)|   contained contains=@Spell transparent extend
syn region starString4 start=|\(^\|\s\)\zs'''| skip=|\\'|  end=|'''\ze\(\s\|$\)| contained contains=@Spell transparent extend

" ORDER MATTERS, so highest priority (loop_, keywords) goes to the bottom of
" the file (except for highlight commands)
syn match starComment excludenl "#.*$" contains=starTodo,@Spell
syn match starTodo    "\(TODO\|FIXME\|XXX\)" contained
syn match starKeyword "\<\(save\|stop\|data\)_\S*"
syn match starLoop    excludenl "loop_.*$" nextgroup=inline_data_entry0

" cluster so we can check for these everywhere
syn cluster starField contains=starLoop,starKeyword,starComment,starString0,starString1,starString2,starString3,starString4

" adding highlight groups to special objects
hi def link starLoop    Repeat
hi def link starKeyword Keyword
hi def link starTodo    Error
hi def link starComment Comment

" match columns to different highlight groups (vim colorscheme should color them
" differently for it to work properly)
hi def link column0 String
hi def link column1 Comment
hi def link column2 PreProc
hi def link column3 Number
hi def link column4 Identifier
hi def link column5 Type
hi def link column6 Special
hi def link column7 NONE
" match columns to headers
hi def link header0 column0
hi def link header1 column1
hi def link header2 column2
hi def link header3 column3
hi def link header4 column4
hi def link header5 column5
hi def link header6 column6
hi def link header7 column7
" and the same for inline data entries
hi def link inline_data_entry0 column0
hi def link inline_data_entry1 column1
hi def link inline_data_entry2 column2
hi def link inline_data_entry3 column3
hi def link inline_data_entry4 column4
hi def link inline_data_entry5 column5
hi def link inline_data_entry6 column6
hi def link inline_data_entry7 column7

let b:current_syntax = "starfile"

" vim: ts=8 sw=2
