" version info of envyvim
let g:envyvim_version = "0.1.0"
" disable all keymaps of plugins
let g:envyvim_disable_mappings = 0
" disable some plugins keymap
let g:envyvim_disable_pmaping = []

if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

set ts=2 expandtab

" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let $THINKVIM = expand($HOME.'/.config/envyvim')

" set the user config file
let s:user_init_config = expand($THINKVIM.'/init.vim')

" Disable vim distribution plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Initialize base requirements
if has('vim_starting')
	" Global Mappings "{{{
	" Use spacebar as leader and ; as secondary-leader
	" Required before loading plugins!
	let g:mapleader="\<Space>"
  let g:maplocalleader=','

	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>
	noremap <c-k> <c-i>

endif

call utils#source_file($VIM_PATH,'core/packman.vim')
call utils#source_file($VIM_PATH,'core/general.vim')
call utils#source_file($VIM_PATH,'core/filetype.vim')

" Load user init config
call utils#check_source(s:user_init_config)
" Load key map
call utils#source_file($VIM_PATH,'keybinds/leaderkey.vim')

" Initialize user favorite colorscheme
call theme#init()
call utils#source_file($VIM_PATH,'core/color.vim')

" Generate coc-settings.json
call utils#generate_coc_json()

set secure

" vim: set ts=2 sw=2 tw=80 noet :
