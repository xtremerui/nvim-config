if exists('g:vscode')
  " VSCode extension
else
  " ordinary neovim
  execute pathogen#infect()

  " enable mouse in all modes
  set mouse=a

  " use comma as leader key
  let mapleader=","

  " reveal neighbor text when nearing screen borders
  set scrolloff=1
  set sidescrolloff=5

  " always assume bash when executing stuff
  set shell=/bin/bash
  let $SHELL="/bin/bash"

  " 2 spaces for tabs
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2

  " enable line number gutter
  set number

  " place swap files somewhere more sane
  set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
  set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

  " undo persists across sessions
  if has('persistent_undo')
    set undofile
    set undodir=~/.nvim/.undo
  endif

  " ignore binary files
  set wildignore+=*.a

  " escape with smashing j and k; easier to press quickly on slow systems
  imap jk <esc>
  imap kj <esc>

  " clear highlights on space
  nmap <space> :noh<cr>

  " shorthand for window switching
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  " work around sketchy <C-h> behavior; hopefully this can be removed someday
  nmap <BS> <C-w>h

  " sensible long line navigation
  nmap j gj
  nmap k gk

  " don't insert two spaces after ., ?, or ! when gq'ing
  set nojoinspaces

  " don't auto-fold
  set foldlevelstart=99

  " set a file for spellwords
  set spellfile=~/.config/nvim/spell.utf-8.add

  " load language-specific configuration
  runtime! lang/*.vim

  " load plugin-centric config
  runtime! ext/colors.vim
  runtime! ext/coc.vim
  runtime! ext/lightline.vim
  runtime! ext/multiple-cursors.vim
  runtime! ext/coc-list.vim
  runtime! ext/completion.vim
  runtime! ext/undotree.vim

  " source local config if any
  if !empty(glob("~/.nvimrc.local"))
    source ~/.nvimrc.local
  end

  " coc extensions
  let g:coc_global_extensions =
        \ [
        \   'coc-lists',
        \   'coc-git',
        \   'coc-go',
        \   'coc-sh',
        \   'coc-css',
        \   'coc-html',
        \   'coc-vimlsp'
        \ ]

  " enable fzf.vim
  set rtp+=/opt/homebrew/opt/fzf
  " use same shortcut of fzf in shell
  nmap <C-t> :Files<cr>

  set cursorcolumn
  set cursorline
endif
