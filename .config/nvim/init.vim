call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rhysd/vim-clang-format' 

"vimtex
"
Plug 'lervag/vimtex'

"neomake
Plug 'neomake/neomake'

"eclim??
"Plug 'dansomething/vim-eclim'

Plug 'mfussenegger/nvim-jdtls'
"Syntax highlighting for magma
Plug 'petRUShka/vim-magma'

"vim git stuff
Plug 'tpope/vim-fugitive'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

""Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"will make vim to reload files that are saved but not edited..
Plug 'djoshea/vim-autoread'

""Plug 'plasticboy/vim-markdown'

""Plug 'nvim-lua/completion-nvim'
""Plug 'steelsojka/completion-buffers'

Plug 'hrsh7th/nvim-compe'

" TODO : can try ncm2 for maybe faster performance?
"Deoplete
""if has('nvim')
""  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""else
""Plug 'Shougo/deoplete.nvim'
""Plug 'roxma/nvim-yarp'
""Plug 'roxma/vim-hug-neovim-rpc'
""endif

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

""Plug 'deoplete-plugins/deoplete-lsp'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

""Plug 'Shougo/neosnippet.vim'
""Plug 'Shougo/neosnippet-snippets'


"python3 support for neovim:
"pip3 install --user pynvim

"Vim table mode
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

"enable vimtex
let g:vimtex_enabled=1 
let g:vimtex_quickfix_enabled=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_ignore_filters = [
      \ 'Warning',
      \ 'Underfull',
      \ 'Overfull',
      \]



if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=y
endif


syntax on
set mouse=a
set noswapfile
set incsearch 
set showmatch 
set encoding=utf-8
set backspace=indent,eol,start
set hlsearch
set number
"relative line numbers on all files!
set relativenumber
set laststatus=2
set ruler
set tabstop=4 shiftwidth=4 expandtab
set autoread
set ignorecase
set smartcase
set background=dark

colorscheme dracula

hi! Normal ctermbg=NONE guibg=NONE
"hi! Visual guibg=#64666D

"hi! Visual guibg=#70727A
"hi! Visual guibg=#56596A
"hi! NonText ctermbg=NONE guibg=NONE
"hi! Cursor guibg=white guifg=black
"set cursorline
"set guicursor=
"hi! MatchParen  guibg=darkgreen
set termguicolors

set path+=**
set wildmenu
set hidden "allows switching buffers without saving

filetype on
filetype indent on
filetype plugin on

"open links correctly with gx
nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>

"change buffer directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"visually select text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"copy file name
nnoremap cf :let @+=expand("%:t")<CR>
nnoremap yf :let @"=expand("%:t")<CR>
"copy file path
nnoremap cF :let @+=expand("%:p")<CR>
nnoremap yF :let @"=expand("%:p")<CR>

"open quickfix list
nnoremap <C-q> :copen<CR>
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <leader>j :lnext<CR>zz
nnoremap <leader>k :lprev<CR>zz

nnoremap <Leader>te :tabe<cr>:Ex<cr>
nnoremap <silent> <Leader>tc :tabclose<cr>
"nnoremap k gk
"nnoremap j gj

""nnoremap <C-h> <C-w> h
""nnoremap <C-j> <C-w> j
""nnoremap <C-k> <C-w> k
""nnoremap <C-l> <C-w> l
map <C-c> "+y<CR>

"bracket completion
inoremap ( ()<esc>ha
inoremap { {}<esc>ha
inoremap {<cr> {<cr>}<esc>kA<cr><esc>cc
inoremap [ []<esc>ha
"inoremap ' ''<esc>ha
inoremap " ""<esc>ha

"modifying brackets
noremap <Leader>( ci(
noremap <Leader>) ci)
noremap <Leader>{ ci{
noremap <Leader>} ci}
noremap <Leader>[ ci[
noremap <Leader>] ci]
noremap <Leader>< ci<
noremap <Leader>> ci>
noremap <Leader>' ci'
noremap <Leader>' ci"

" set neovim's current directory to what I'm using  in terminal buffer shitty
" solution but works: https://www.reddit.com/r/neovim/comments/7fafxv/set_neovims_current_directory_to_the_one_im_using/
tnoremap <C-A> pwd\|xclip -selection clipboard<CR><C-\><C-n>:cd <C-r>+<CR>i

"To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>
"To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"view and reload vimrc
nnoremap <Leader>sv: :source ~/.config/nvim/init.vim<cr>
nnoremap <Leader>ev: :vsplit ~/.config/nvim/init.vim<cr>
" use urlview
"nnoremap <Leader>u :w<Home>slient <End> !urlview<CR>
noremap <Leader>u :w<Home>silent <End> !urlview<CR>


"table mode compatibility with markdown
let g:table_mode_corner='|'


"Telescope
"Turns off deoplete completion in telescope prompt
""autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser()<cr>

nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"Deoplete
""let g:deoplete#enable_at_startup = 1
"""when you press enter it will complete function args (when in lsp) with
"""vsnip/neosnippet !
"""imap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"
""set completeopt+=menuone,preview

"defx settings
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

autocmd BufWritePost * call defx#redraw()

"lsp active parameter highlight
hi! link LspSignatureActiveParameter DraculaGreenItalicUnderline

"lsp settings
lua << EOF

local function preview_location_callback(_, _, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end


local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua PeekDefinition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) -- not supported by clang yet
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
   buf_set_keymap('n', '<space>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
  -- buf_set_keymap('n', '<space>ca', "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>", opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<leader>dd', "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", opts)
  buf_set_keymap('n', '<leader>wd', "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
  -- buf_set_keymap('n', '<leader>ws', "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  buf_set_keymap('n', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", opts)

  -- clang header open in vsplit (see below)
  buf_set_keymap('n', '<leader>h', '<cmd>:ClangdSwitchSourceHeaderVSplit<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

    --Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end



-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches

--  local servers = { "pyright", "rust_analyzer", "tsserver" }
--  for _, lsp in ipairs(servers) do
--    nvim_lsp[lsp].setup { on_attach = on_attach, }
--  end


 -- to open header file as a vsplit
local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = require'lspconfig'.util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, _, result)
        if err then error(tostring(err)) end
        if not result then print ("Corresponding file can’t be determined") return end
        vim.api.nvim_command(splitcmd..' '..vim.uri_to_fname(result))
    end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

   nvim_lsp.clangd.setup {
        on_attach = on_attach,
        commands = {
    	    ClangdSwitchSourceHeader = {
                function() switch_source_header_splitcmd(0, "edit") end;
                description = "Open source/header in current buffer";
            },
            ClangdSwitchSourceHeaderVSplit = {
                function() switch_source_header_splitcmd(0, "vsplit") end;
                description = "Open source/header in a new vsplit";
            },
            ClangdSwitchSourceHeaderSplit = {
                function() switch_source_header_splitcmd(0, "split") end;
                description = "Open source/header in a new split";
            }
     
        },
        -- this will expand the function overloads as explained in https://github.com/clangd/clangd/issues/172
        -- cmd = { "clangd", "--background-index", "--completion-style=detailed" },
        cmd = { "clangd", "--background-index" },
        capabilities = capabilities,
   }
EOF

"For comment highlighting (such as TODO, FIXME, ... ) install the `comment` parser!
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {},
    },
  	incremental_selection = {
		enable = true,
		keymaps = {
		    init_selection = "gnn",
		  	node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
  	indent = {
		enable = true
	},
}
EOF

"completion-nvim settings
""" Use completion-nvim in every buffer
""autocmd BufEnter * lua require'completion'.on_attach()
""" Use <Tab> and <S-Tab> to navigate through popup menu
""inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
""inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""
""" Set completeopt to have a better completion experience
""set completeopt=menuone,noinsert,noselect
""
""
""""let g:completion_confirm_key = ""
""imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
""		\ "\<Plug>(completion_confirm_completion)"  :
""		\ "\<c-e>\<CR>" : "\<CR>"
""""let g:completion_confirm_key = "\<C-y>"
""
"""change completion source
"""imap  <c-j> <Plug>(completion_next_source)
"""imap  <c-k> <Plug>(completion_prev_source)
""let g:completion_enable_snippet = 'vim-vsnip'
""let g:completion_sorting = "length"
""let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"""let g:completion_enable_auto_paren=1
"""matching smart case completion
""let g:completion_matching_smart_case = 1
""let g:completion_trigger_on_delete = 1
""
""""lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
""let g:completion_chain_complete_list = [
""    \{'complete_items': ['lsp']},
""    \{'complete_items': ['path'], 'triggered_only': ['/']},
""    \{'complete_items': ['buffers']},
""    \{'complete_items': ['vim-vsnip']},
""    \{'mode': '<c-p>'},
""    \{'mode': '<c-n>'},
""\]
""let g:completion_auto_change_source = 1
""
""" Avoid showing message extra message when using completion
set shortmess+=c


"nvim-compe settings
lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  -- default_pattern = '\\h\\w*\\%(-\\w*\\)*';
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    --border = "single",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    omni = {
        filetypes = {'tex'},
        priority=1000;
    },
    path = true;
    buffer = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;

    calc = false;
    ultisnips = false;
    luasnip = false;
  };
}
EOF


"nvim-compe keybindings
set completeopt=menuone,noselect
"when press space it will close completion buffer
"imap <expr><Space> pumvisible() ? "\<C-e>\<Space>" : "\<Space>"
"imap <expr><Space> pumvisible() ? "\<Space>\<C-e>\<C-e>" : "\<Space>"
""imap <expr><Space> pumvisible() ? "<CR>" : "\<Space>"
inoremap <silent><expr> <C-c> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
highlight link CompeDocumentation NormalFloat

"neosnippet config
""let g:neosnippet#enable_completed_snippet = 1
""let g:neosnippet#enable_complete_done = 1
""""
""""" Plugin key-mappings.
""" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <C-j>    <Plug>(neosnippet_expand_or_jump)
""smap <C-j>    <Plug>(neosnippet_expand_or_jump)
""xmap <C-j>    <Plug>(neosnippet_expand_or_jump)
""nmap <C-j>    <Plug>(neosnippet_expand_or_jump)


" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Expand the completed snippet trigger by <CR>.
"imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<CR>"
"imap <expr><CR> neosnippet#expandable_or_jumpable() ?"\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

"vsnip config
" Expand
imap <expr> <TAB> vsnip#available(1) ? '<Plug>(vsnip-expand)' : '<TAB>'
imap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
smap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
imap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
smap <expr> <C-k> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
"nmap        s   <Plug>(vsnip-select-text)
"xmap        s   <Plug>(vsnip-select-text)
"nmap        S   <Plug>(vsnip-cut-text)
"xmap        S   <Plug>(vsnip-cut-text)





" making the autocmpletion a bit more pleaseant
autocmd CompleteDone * silent! pclose!
autocmd InsertLeave * silent! pclose!

set updatetime=1000

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow


"autocmd!  BufRead,BufEnter *.tex source ~/.config/nvim/init_tex.vim

augroup filetypeAutoCommands
    autocmd! filetypeAutoCommands

    au  BufRead,BufEnter * checktime

    au VimResized * exe "normal \<c-w>="
    
    
    " NOTE Using BufEnter might be a better idea because there are some cases where BufRead will not tigger
    
    au  VimResized * exe "normal \<c-w>="

" tex
    au  BufRead,BufEnter *.tex source ~/.config/nvim/init_tex.vim
" autocmd BufRead,BufEnter *.tex :!make

"removes the auto insertion of comments for c and c++ files
    au FileType c,cpp setlocal formatoptions-=cro
" c++
    au  BufReadPre,BufRead,BufEnter *.cpp source ~/.config/nvim/init_cpp.vim
    au  BufReadPre,BufRead,BufEnter *.hpp source ~/.config/nvim/init_cpp.vim

" c
    au  BufReadPre,BufRead,BufEnter *.c source ~/.config/nvim/init_cpp.vim
    au  BufReadPre,BufRead,BufEnter *.h source ~/.config/nvim/init_cpp.vim

" haskell
    au  BufReadPre,BufRead,BufEnter *.hs source ~/.config/nvim/init_haskell.vim

" java
    au  BufReadPre,BufRead,BufEnter *.java source ~/.config/nvim/init_java.vim

" python
    au  BufReadPre,BufRead,BufEnter *.py source ~/.config/nvim/init_python.vim

" md
    au  BufRead,BufEnter *.md source ~/.config/nvim/init_md.vim

" update sxhkdrc
    au  BufWritePost *sxhkdrc :!killall sxhkd; sxhkd &
augroup END

"autocmd  BufWritePost ~/dwm-haiyang/*.h :!sudo make clean install
"autocmd  BufWritePost ~/dwm-haiyang/*.c :!sudo make clean install
autocmd  BufWritePost *.Xresources :!xrdb .Xresources

" vim
"autocmd BufRead,BufEnter *. source ~/.vimrc
"let g:EclimCompletionMethod = 'omnifunc'
