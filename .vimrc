set nocompatible                "be iMproved, required

so ~/.vim/plugins.vim



syntax enable

set backspace=indent,eol,start	"backspace- standardowe dzialanie
let mapleader=','       	    "Domyślnie znakiem leader jest \, tutaj zmieniam na ,
set number              	    "Aktywacja numerów linii
set complete=.,w,b,u 		    "Ustawienie podpowiedzi do autouzupełniania
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4


"----Viuals----"
set t_Co=256
colorscheme atom-dark-256
hi LineNr ctermbg=bg 




"----Searching----"
set hlsearch
set incsearch





"----Mappings----"

"Szybkie otwieranie pliku konfiguracyjnego"
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Szybkie otwieranie pliku do definiowania snippetow"
nmap <leader>es :e ~/.vim/snippets/<cr>

"Dodanie usuwania zaznaczenia wyszukania"
nmap <leader><space> :nohlsearch<cr>

"Wygodniejsze poruszanie się między panelami"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-H> <C-W><C-H>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"Łatwe przełączanie NERDTree"
nmap <leader>1 :NERDTreeToggle<cr>

nmap <C-R> :CtrlPBufTag<cr>
nmap <leader>e :CtrlPMRUFiles<cr>




"----Plugins----"

"/
"/CtrlP
"/
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/NerdTREE
"/
let NERDTreeHijackNetrw = 0


"/
"/greplace
"/
set grepprg=ag
let g:grep_cmd_opts='--line-numbers --noheading'




"----Laravel Specific----"
nmap <leader>lw :e routes/web.php<cr>
nmap <leader>la :e routes/api.php<cr>
nmap <leader>lm :!php artisan make:
nmap <leader>lfc :CtrlP<cr>app/Http/Controllers/
nmap <leader>lfm :CtrlP<cr>app/


"----Auto-Commands----"

"Automatycznie robi source pliku vimrc"

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




function! IPhpInsertUse()
	call PhpInsertUse()
        call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
	    call PhpExpandClass()
	        call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"Sort PHP use statements
""http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"Notes and Tips
"
"- 'gg'- przejście na początek pliku
"- 'zz'- zmiana widoku, aby kursor był na środku ekranu
"
"- w konsoli- ctags -R; - tworzy plik z tagami. Następnie, aby udać się do
"metody z innego pliku, na której jest kursor- ctr + ]. Aby wrócić do
"poprzedniego miejsca w którym byłem- ctr + ^.
