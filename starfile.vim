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

"syn case match

syn keyword starLoop       loop_ nextgroup=header0
syn match   starKeyword    "\<\(save\|stop\|data\)_" fold
syn match   starComment    "#.*$" contains=starTodo,@Spell
syn match   starTodo       "\(TODO\|FIXME\|XXX\)" contained
syn cluster starField contains=starRepeat,starKeyword,starComment

" priority goes to last, which then gives priority to the one just above
syntax match column7 "\s*\S\+\(\s*\|$\)" nextgroup=column0 contains=@starField
syntax match column6 "\s*\S\+\(\s*\|$\)" nextgroup=column7 contains=@starField
syntax match column5 "\s*\S\+\(\s*\|$\)" nextgroup=column6 contains=@starField
syntax match column4 "\s*\S\+\(\s*\|$\)" nextgroup=column5 contains=@starField
syntax match column3 "\s*\S\+\(\s*\|$\)" nextgroup=column4 contains=@starField
syntax match column2 "\s*\S\+\(\s*\|$\)" nextgroup=column3 contains=@starField
syntax match column1 "\s*\S\+\(\s*\|$\)" nextgroup=column2 contains=@starField
syntax match column0 "\s*\S\+\(\s*\|$\)" nextgroup=column1 contains=@starField

" same thing for headers
syntax region header7 start="\<_\S\+" end="\n" nextgroup=header0 contains=@starField skipwhite
syntax region header6 start="\<_\S\+" end="\n" nextgroup=header7 contains=@starField skipwhite
syntax region header5 start="\<_\S\+" end="\n" nextgroup=header6 contains=@starField skipwhite
syntax region header4 start="\<_\S\+" end="\n" nextgroup=header5 contains=@starField skipwhite
syntax region header3 start="\<_\S\+" end="\n" nextgroup=header4 contains=@starField skipwhite
syntax region header2 start="\<_\S\+" end="\n" nextgroup=header3 contains=@starField skipwhite
syntax region header1 start="\<_\S\+" end="\n" nextgroup=header2 contains=@starField skipwhite
syntax region header0 start="\<_\S\+" end="\n" nextgroup=header1 contains=@starField skipwhite

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
hi def link column3 Special
hi def link column4 Identifier
hi def link column5 Type
hi def link column6 Number
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

let b:current_syntax = "starfile"

" vim: ts=8 sw=2
