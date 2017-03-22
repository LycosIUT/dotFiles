" Enable plugins with pathogen
execute pathogen#infect()

syntax on		"enable highlight color
set smartindent		"enable auto-indention
set encoding=utf8	"set utf8 as standard encoding
colorschem lycos

"#################### LINES ###########################################
set relativenumber	"Active relative ligne numerotation
set number		"Active current line numerotation
set numberwidth=5	"Fix margin left numerotation
set so=5		"Fix the number of lines from cursor to display
"######################################################################

"################# NERDTREE ######################################
map <C-h> :NERDTreeToggle<CR>		"Open NERDTree with ctrl+h
"#################################################################

"################# SEARCH ################################
set hlsearch		" Highlight search result
set incsearch		" Show search results while typing
set ignorecase		" Ignore case while searching
set smartcase		" Smart search with case
"#########################################################

"################ LIST #####################
set list
set listchars=tab:··,trail:·
hi SpecialKey ctermfg=50
"###########################################

"################ TAGBAR ###################
filetype on
nmap <F8> :TagbarToggle<CR>
"###########################################

"################ AIRLINE ##################
set laststatus=2
set noshowmode
set t_Co=256
"###########################################
