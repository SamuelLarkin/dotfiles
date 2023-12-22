" vim:nowrap:

""""""""""""""""""""""""""""""""""""""""
" vim-plug
" [vim-plug](https://github.com/junegunn/vim-plug)
" Minimalist Vim Plugin Manager
" List of many vim plugins:
"   https://github.com/vim-scripts?tab=repositories
" [Awesome Vim plugins from across the Universe](https://vimawesome.com/)
" INSTALLATION:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   :PlugInstall

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" IMPORTANT: Make sure you use single quotes

" [l9](http://vim-scripts.org/vim/scripts.html)
" is a Vim-script library, which provides some utility functions and
" commands.
" for programming in Vim.
"Plug 'vim-scripts/L9'

" [fzf](https://github.com/junegunn/fzf)
" fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Fzf.vim Files => all files under current directory
nmap <leader>ff :Files<CR>
" Fzf.vim GFiles => git ls-files only
nmap <leader>fg :GFiles<CR>
" Fzf.vim GFiles? => git diff -name-only
nmap <leader>fh :GFiles?<CR>
" Fzf.vim Buffers => vim opened buffers
nmap <leader>fb :Buffers<CR>
" Fzf.vim Changes => Changelist across all open buffers
nmap <leader>fc :Changes<CR>
" Fzf.vim Marks => Marks
nmap <leader>fm :Marks<CR>
" Fzf.vim Jumps => Jumps
nmap <leader>fj :Jumps<CR>
" Fzf.vim Tags => Tags
nmap <leader>ft :Tags<CR>
" Fzf.vim GFiles => Git files (git status)
nmap <leader>fs :GFiles?<CR>


" [BufExplorer](https://github.com/jlanzarotta/bufexplorer)
" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer'
let g:bufExplorerSortBy='mru'

" [Tagbar](https://github.com/majutsushi/tagbar)
" Awesome source code [tag]browsing
" Displays a file/class explorer using :TagbarOpen
Plug 'majutsushi/tagbar'
let g:tagbar_ctags_bin="$HOME/.local/bin/ctags"
" Tagbar
nmap <leader>tt :TagbarToggle<CR>
nmap <leader>tn :TagbarJumpNext<CR>
nmap <leader>tp :TagbarJumpPrev<CR>


" [tabular](https://github.com/godlygeek/tabular)
" Vim script for text filtering and alignment
" howoto: `:'<,'>Tabularize /=`
Plug 'godlygeek/tabular'

" [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
" One colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'

" [diffconflicts](https://github.com/whiteinge/diffconflicts)
" This converts a file containing conflict markers into a two-way diff.
" git config --global merge.tool diffconflicts
" git config --global mergetool.diffconflicts.cmd 'vim -c DiffConflicts `$MERGED` `$BASE` `$LOCAL` `$REMOTE`'
" git config --global mergetool.diffconflicts.trustExitCode true
" git config --global mergetool.keepBackup false
Plug 'whiteinge/diffconflicts'

" [vim-surround](https://github.com/tpope/vim-surround)
" Surround.vim is all about `surroundings`: parentheses, brackets, quotes,
" XML tags, and more. The plugin provides mappings to easily delete, change
" and add such surroundings in pairs.
" https://github.com/tpope/vim-surround
"Plug 'tpope/vim-surround'

" [vim-sneak](https://github.com/justinmk/vim-sneak)
" The missing motion for Vim.
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

"""""""""""""""""""""""""""""""""""
" FANCY VIM PLUGINS
" https://danyspin97.org/blog/fancy-vim-plugins/

" Highlighting
" {
   " [rainbow](https://github.com/luochen1990/rainbow)
   " Rainbow Parentheses Improved, shorter code, no level limit, smooth and
   " fast, powerful configuration.
   Plug 'luochen1990/rainbow'
   let g:rainbow_active = 1

   " [vim-illuminate](https://github.com/RRethy/vim-illuminate)
   " illuminate.vim - Vim plugin for selectively illuminating other uses of
   " the current word under the cursor
   Plug 'RRethy/vim-illuminate'
   let g:Illuminate_delay = 250

   " [vim-search-pulse](https://github.com/inside/vim-search-pulse)
   " easily locate the cursor after a search.
   " it pulses every time you scroll the search results by pressing n/N.
   Plug 'inside/vim-search-pulse'
   let g:vim_search_pulse_duration = 200
" }

" GIT
" {
   " [vcscommand](https://github.com/vim-scripts/vcscommand.vim)
   " VIM 7 plugin useful for manipulating files controlled by CVS, SVN, SVK,
   " git, bzr, and hg within VIM, including committing changes and performing
   " diffs using the vimdiff system.
   "Plug 'vim-scripts/vcscommand.vim'
   "Plug 'http://repo.or.cz/r/vcscommand.git'
   " :VCSVimDiff
   Plug 'vim-scripts/vcscommand.vim'
   nmap <leader>vv  <Plug>VCSVimDiff


   " [vim-fugitive](https://github.com/tpope/vim-fugitive)
   " Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git
   " plugin for Vim? Either way, it's `so awesome, it should be illegal`.
   " That's why it's called Fugitive.
   Plug 'tpope/vim-fugitive'

   " [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
   " A Vim plugin which shows a git diff in the sign column. It shows which
   " lines have been added, modified, or removed. You can also preview, stage,
   " and undo individual hunks; and stage partial hunks. The plugin also
   " provides a hunk text object.
   Plug 'airblade/vim-gitgutter'
   " To turn on line highlighting by default
   let g:gitgutter_highlight_lines = 1
   nmap ]h <Plug>(GitGutterNextHunk)
   nmap [h <Plug>(GitGutterPrevHunk)
" }

" Python
" {
   " [taghelper](https://github.com/mgedmin/taghelper.vim)
   " vim plugin that shows the current function/tag in the statusline.
   " NOTE: this plugin works for c, c++, python, diff & javascript
   " NOTE: I need to find a way to disable taghelper#curtag() in my status
   " line.
   "Plug 'mgedmin/taghelper.vim', { 'for': ['c', 'cpp', 'python', 'diff', 'javascript'] }
   Plug 'mgedmin/taghelper.vim'

   " [Pythonsense](https://github.com/jeetsukumaran/vim-pythonsense)
   " Pythonsense is a Vim plugin that provides text objects and motions for
   " Python classes, methods, functions, and doc strings.
   Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

   " [jedi-vim](https://github.com/davidhalter/jedi-vim)
   " awesome Python autocompletion with VIM
   " git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
   Plug 'davidhalter/jedi-vim', { 'for': 'python' }

   " [vim-isort](https://github.com/fisadev/vim-isort)
   " Vim plugin to sort python imports using
   " https://github.com/timothycrosley/isort
   "Plug 'fisadev/vim-isort', { 'for': 'python' }

   " [isort.vim](https://github.com/brentyi/isort.vim)
   " Async isort plugin for Vim + Neovim
   " https://github.com/timothycrosley/isort
   Plug 'brentyi/isort.vim', { 'for': 'python' }
   augroup IsortMappings
      autocmd!
      autocmd FileType python nnoremap <buffer> <Leader>ci :Isort<CR>
      autocmd FileType python vnoremap <buffer> <Leader>ci :Isort<CR>
      autocmd BufWritePre *.py call isort#Isort(0, line('$'), v:null, v:false)
   augroup END

   " [black](https://github.com/psf/black)
   " The uncompromising Python code formatter
   " black.readthedocs.io/en/stable/
   Plug 'psf/black', { 'for': 'python' }
   augroup IsortMappings
      autocmd!
      autocmd FileType python nnoremap <buffer> <Leader>cb :Black<CR>
      autocmd FileType python vnoremap <buffer> <Leader>cb :Black<CR>
      autocmd BufWritePre *.py :Black
   augroup END

   " [vim-flake8](https://github.com/nvie/vim-flake8.git)
   " is a Vim plugin that runs the currently open file through Flake8, a
   " static syntax and style checker for Python source code. It supersedes
   " both vim-pyflakes and vim-pep8.
   "Plug 'nvie/vim-flake8', { 'for': 'python' }
   "augroup Flake8
   "   autocmd BufWritePost *.py call flake8#Flake8()
   "augroup END

   " [semshi](https://github.com/numirias/semshi)
   " Semantic Highlighting for Python in Neovim
   "Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
   "Plug 'numirias/semshi', { 'for': 'python' }
" }

" Rust
" {
   " [rust](https://github.com/rust-lang/rust.vim)
   " Vim configuration for Rust
   Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" }

" JSON
" {
   " [vim-json](https://github.com/elzr/vim-json)
   " A better JSON for Vim: distinct highlighting of keywords vs values,
   " JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
   " https://github.com/elzr/vim-json
   Plug 'elzr/vim-json', { 'for': 'json' }
" }

" JQ scripts
" {
   " [jq.vim](https://github.com/vito-c/jq.vim)
   " Syntax highlighting for jq files in vim/neovim
   autocmd BufNewFile,BufRead *.jq	set filetype=jq
   Plug 'vito-c/jq.vim', { 'for': 'jq' }
" }

" XPath
" {
   " [vim-xpath](https://github.com/actionshrimp/vim-xpath)
   " XPath search plugin for Vim
   " https://github.com/actionshrimp/vim-xpath
   Plug 'actionshrimp/vim-xpath'
" }

" HTML
" {
   " [sparkup](https://github.com/rstacruz/sparkup)
   " A parser for a condensed HTML format
   " Pass the path to set the runtimepath properly.
   Plug 'rstacruz/sparkup', {'rtp': 'vim/', 'for': 'html'}
" }


"""""""""""""""""""""""""""""""""""""
" Under testing, waiting for approval.

" LSP
" {
  source ~/.config/vim/lsp.vim
" }

" [ale](https://github.com/dense-analysis/ale)
" Asynchronous Lint Engine
"Plug 'dense-analysis/ale'
" [How can I show errors or warnings in my statusline](https://github.com/dense-analysis/ale#5vii-how-can-i-show-errors-or-warnings-in-my-statusline)
let g:airline#extensions#ale#enabled = 1
" [Using black and isort with Vim](https://codeinthehole.com/tips/using-black-and-isort-with-vim/)
let b:ale_fixers = ['trim_whitespace', 'isort', 'black', 'flake8']
let b:ale_fix_on_save = 1

" [CTRL-P](https://github.com/ctrlpvim/ctrlp.vim)
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://ctrlpvim.github.io/ctrlp.vim/
"Plug 'ctrlpvim/ctrlp.vim'
"if executable('ugrep')
"   set runtimepath^=~/.vim/bundle/ctrlp.vim
"   let g:ctrlp_match_window='bottom,order:ttb'
"   "let g:ctrlp_user_command='ugrep "" %s -Rl -I --ignore-files -3'
"   let g:ctrlp_user_command='ugrep "" %s -Rl -I --ignore-files'
"endif

" Nim
" {
   " [nim](https://github.com/zah/nim.vim)
   " Nim language plugin for vim.
   Plug 'zah/nim.vim', { 'for': 'nim' }
" }

" TypeScript & React
" {
   " [Modern TypeScript and React Development in Vim](https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim)

   " [vim-jsx-typescript](https://github.com/peitalin/vim-jsx-typescript)
   " Syntax highlighting and indentation for JSX in Typescript
   " (typescriptreact filetypes).
   " vim-jsx-typescript works with the built-in typescript syntax
   " highlighter and indentation engine for recent versions of Vim/Neovim.
   " set filetypes as typescriptreact
   autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
   Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescriptreact' }

   " [vim-javascript](https://github.com/pangloss/vim-javascript)
   " Vastly improved Javascript indentation and syntax support in Vim.
   Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

   " [typescript-vim](https://github.com/leafgarland/typescript-vim)
   " Typescript syntax files for Vim
   Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

   " [vim-styled-components](https://github.com/styled-components/vim-styled-components)
   " Vim bundle for http://styled-components.com based javascript files.
   " TODO Not sure if this is for css?
   Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'css' }

   " [vim-graphql](https://github.com/jparise/vim-graphql)
   " A Vim plugin that provides GraphQL file detection, syntax
   " highlighting, and indentation.
   autocmd BufNewFile,BufRead *.prisma set filetype=graphql
   Plug 'jparise/vim-graphql', { 'for': 'graphql' }
" }

" [which-key.nvim](https://github.com/folke/which-key.nvim)
" 💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim
" 0.5 that displays a popup with possible keybindings of the command you
" started typing.
if has('nvim')
   Plug 'folke/which-key.nvim'
endif

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"
" Brief help
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins
