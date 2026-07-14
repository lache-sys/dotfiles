{ config, pkgs, inputs, ... }:
{
  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
      plugins = [
        pkgs.vimPlugins.fzf-wrapper
        pkgs.vimPlugins.vim-nix
        pkgs.vimPlugins.nerdtree
        pkgs.vimPlugins.open-browser-vim
        pkgs.vimPlugins.rainbow
        pkgs.vimPlugins.vim-nerdtree-syntax-highlight
      ];
      settings = {
      };
      extraConfig = ''
        autocmd Filetype python setlocal ts=2 sw=2 expandtab
        hi Comment ctermfg=3
        let g:previm_enable_realtime = 1
        let g:python_recommended_style = 0
        nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
        nnoremap <silent> <C-j> :bprev<CR>
        nnoremap <silent> <C-k> :bnext<CR>
        set ambiwidth=double
        set backspace=indent,eol,start
        set cinoptions+=:0
        set clipboard=unnamed,autoselect
        set cmdheight=2
        set display=lastline
        set encoding=utf-8
        set expandtab
        set fileencodings=utf-8,sjis
        set guioptions+=R
        set guioptions+=a
        set guioptions-=T
        set guioptions-=m
        set hidden
        set history=10000
        set hlsearch
        set ignorecase
        set incsearch
        set laststatus=2
        set linespace=4
        set list
        set listchars=eol:$,tab:^\ ,trail:~
        set mouse=a
        set nobackup
        set noerrorbells
        set nofoldenable
        set noswapfile
        set nowritebackup
        set nrformats=
        set number
        set relativenumber
        set shellslash
        set shiftwidth=2
        set tabstop=2
      '';
    };
  };
}
