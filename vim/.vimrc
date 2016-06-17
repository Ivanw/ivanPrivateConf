" This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
"     debian.vim

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    set nocompatible

    " Vim5 and later versions support syntax highlighting. Uncommenting the
    " following enables syntax highlighting by default.
    if has("syntax")
      syntax on            " syntax highlight
    endif

    colorscheme codeschool " elflord ron peachpuff default ,vim colour plan locate in /usr/share/vim/vim72/colors

    " detect file type
    filetype on
    filetype plugin on

    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    " set background=dark

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      "have Vim load indentation rules and plugins according to the detected filetype
      filetype plugin indent on
    endif

    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.

    set ignorecase       " 
    "set smartcase        " 
    "set autowrite         "
    "set autoindent        " 
    "set smartindent        " 
    set tabstop=4        " 
    "set softtabstop=4     "     
    set shiftwidth=4    " 
	set expandtab
"	set autoindent

    set incsearch
    set cindent            " 
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "
    "set backspace=2    " 
    set showmatch        " 
    set linebreak        " 
    set whichwrap=b,s,<,>,[,] "
    "set hidden " Hide buffers when they are abandoned
    "set mouse=a            " Enable mouse usage (all modes)
    set number            " Enable line number
    "set previewwindow    " 
    set history=50        " set command history to 50
"	set paste


    "--status line setting-- 
    set laststatus=2 "
    set ruler  
    "--cmd setting--
    set showcmd         " 
    set showmode        " 

    "--find setting--
    set incsearch        "
    set hlsearch  
    set tags=tags;
    set tags+=./tags;
    set tags+=~/.vim/tagfiles/tags;
    set tags+=~/.vim/tagfiles/cpp_src_4.8/tags;
"    set tags+=~/.vim/tagfiles/cpp_src/tags;

    set autochdir

    "--OmniCpp Setting--
    imap <F3> <C-X><C-O>
    imap <F2> <C-X><C-I>
    set completeopt=menu,menuone "
    let OmniCpp_MayCompleteDot = 1 " autocomplete with .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
    let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
    let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
    let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
    let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
    let OmniCpp_DefaultNamespaces=["std"]
    let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
    let OmniCpp_ShowAccess=1 


    "--Taglist Setting --
    let Tlist_Ctags_Cmd='ctags' "
    let Tlist_Use_Right_Window=1 "
    let Tlist_Show_One_File=0 "
    let Tlist_File_Fold_Auto_Close=1 "
    let Tlist_Exit_OnlyWindow=1 "
    let Tlist_Process_File_Always=1 "
    let Tlist_Inc_Winwidth=0

    map <F5> :!ctags -R --sort=1 --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
    "	source ~/.vim/my.vim


    "--EchoFunc Setting --
    let g:EchoFuncKeyNext='<C-X><C-N>'
    let g:EchoFuncKeyPrev='<C-X><C-M>'
    
    "--TagBar--"
    nmap <F8> :TagbarToggle<CR> 

