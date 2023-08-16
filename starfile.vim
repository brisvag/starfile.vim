" Vim syntax file
" Language:     STAR file (Relion, mmCIF, ..)
" Maintainer:   Lorenzo Gaifas <brisvag@gmail.com>
" License:      GPLv3
" URL:          https://github.com/brisvag/starfile.vim

" inspired by:
" - https://github.com/mechatroner/rainbow_csv
" - https://www.vim.org/scripts/script.php?script_id=4139

if exists("b:current_syntax")
  finish
endif

" priority goes to last, which then gives priority to the one just above
" each column will try to match the next column (inside loop); otherwise,
" it tries to find the next header (nonloop)
syn match column7 "\s*\S\+\(\s*\|\n;\)" nextgroup=column0,header0 contains=@starField skipwhite
syn match column6 "\s*\S\+\(\s*\|\n;\)" nextgroup=column7,header7 contains=@starField skipwhite
syn match column5 "\s*\S\+\(\s*\|\n;\)" nextgroup=column6,header6 contains=@starField skipwhite
syn match column4 "\s*\S\+\(\s*\|\n;\)" nextgroup=column5,header5 contains=@starField skipwhite
syn match column3 "\s*\S\+\(\s*\|\n;\)" nextgroup=column4,header4 contains=@starField skipwhite
syn match column2 "\s*\S\+\(\s*\|\n;\)" nextgroup=column3,header3 contains=@starField skipwhite
syn match column1 "\s*\S\+\(\s*\|\n;\)" nextgroup=column2,header2 contains=@starField skipwhite
syn match column0 "\s*\S\+\(\s*\|\n;\)" nextgroup=column1,header1 contains=@starField skipwhite

" same thing for headers
syn match header7 "\<_\S\+.*$" nextgroup=header0 contains=@starField skipwhite skipnl
syn match header6 "\<_\S\+.*$" nextgroup=header7 contains=@starField skipwhite skipnl
syn match header5 "\<_\S\+.*$" nextgroup=header6 contains=@starField skipwhite skipnl
syn match header4 "\<_\S\+.*$" nextgroup=header5 contains=@starField skipwhite skipnl
syn match header3 "\<_\S\+.*$" nextgroup=header4 contains=@starField skipwhite skipnl
syn match header2 "\<_\S\+.*$" nextgroup=header3 contains=@starField skipwhite skipnl
syn match header1 "\<_\S\+.*$" nextgroup=header2 contains=@starField skipwhite skipnl
syn match header0 "\<_\S\+.*$" nextgroup=header1 contains=@starField skipwhite skipnl

" same thing for headers
syn region inline_header7 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header0 contains=@starField skipwhite skipnl
syn region inline_header6 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header7 contains=@starField skipwhite skipnl
syn region inline_header5 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header6 contains=@starField skipwhite skipnl
syn region inline_header4 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header5 contains=@starField skipwhite skipnl
syn region inline_header3 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header4 contains=@starField skipwhite skipnl
syn region inline_header2 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header3 contains=@starField skipwhite skipnl
syn region inline_header1 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header2 contains=@starField skipwhite skipnl
syn region inline_header0 start="\<_\S\+\s\+\S\+\s\+" skip="#.*" end="\n" nextgroup=inline_header1 contains=@starField skipwhite skipnl

" ORDER MATTERS, so highest priority (loop_, keywords) goes to the bottom of
" the file (except for highlight commands)
syn match   starComment excludenl "#.*$" contains=starTodo,@Spell
syn match   starTodo    "\(TODO\|FIXME\|XXX\)" contained
syn region  starString  start=|^;| skip=|#| end=|^;| contained contains=@Spell transparent
syn match   starKeyword "\<\(save\|stop\|data\)_\S*" fold
syn match   starLoop    excludenl "loop_.*$" nextgroup=header0

" cluster so we can check for these everywhere
syn cluster starField   contains=starLoop,starKeyword,starComment,starString

syn sync match starLoopSync grouphere inline_header0 "\<\(save\|stop\|data\)_\S*"

" assing highlight groups to special objects
hi def link starLoop            Repeat
hi def link starKeyword         Keyword
hi def link starTodo            Error
hi def link starComment         Comment

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

hi def link inline_header0 column0
hi def link inline_header1 column1
hi def link inline_header2 column2
hi def link inline_header3 column3
hi def link inline_header4 column4
hi def link inline_header5 column5
hi def link inline_header6 column6
hi def link inline_header7 column7

let b:current_syntax = "starfile"

" vim: ts=8 sw=2
