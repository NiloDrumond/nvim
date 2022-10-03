local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Needed to load first
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'goolord/alpha-nvim', config = "require('plugins.alpha')" }

    -- Themes
    use { 'folke/tokyonight.nvim', config = "require('themes.tokyonight')" }
    -- use { 'tanvirtin/monokai.nvim', config = "require('themes.monokai')" }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')" }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
    use { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup({ color = "#F7768E" }) end }
    use { 'nvim-treesitter/nvim-treesitter-context', after = { 'nvim-treesitter' } }


    -- Navigating (Telescope/Tree/Refactor)
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim' }
      }
    }
    use { 'cljoly/telescope-repo.nvim' }
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use { 'nvim-pack/nvim-spectre' }
    use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')" }
    use { 'gbprod/stay-in-place.nvim',
      config = function()
        require('stay-in-place').setup({})
      end
    }
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = "require('plugins.hop')"
    }
    use { "preservim/tagbar", config = "require('plugins.tagbar')" }

    -- LSP Base
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' }

    -- LSP Cmp
    use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
    use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
    use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }

    use { 'David-Kunz/cmp-npm', after = 'nvim-cmp', requires = 'nvim-lua/plenary.nvim',
      config = "require('plugins.cmp-npm')" }
    use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-npm' }

    -- LSP Addons
    use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }
    use { 'onsails/lspkind-nvim' }
    use { 'folke/lsp-trouble.nvim', config = "require('plugins.trouble')" }
    use { 'nvim-lua/popup.nvim' }
    use { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', config = "require('plugins.gps')", after = 'nvim-treesitter' }
    use { 'jose-elias-alvarez/typescript.nvim' }
    use { 'axelvc/template-string.nvim', config = function() require('template-string').setup() end }
    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    }
    use { 'simrat39/rust-tools.nvim', config = "require('plugins.rust-tools')", requires = { 'neovim/nvim-lspconfig' } }
    use { 'lvimuser/lsp-inlayhints.nvim', config = function() require('lsp-inlayhints').setup() end }

    -- General
    use { 'AndrewRadev/switch.vim' }
    use { 'AndrewRadev/splitjoin.vim' }
    use { 'numToStr/Comment.nvim', config = "require('plugins.comment')" }
    use { 'LudoPinelli/comment-box.nvim' }
    use { 'akinsho/nvim-toggleterm.lua', branch = 'main', config = "require('plugins.toggleterm')" }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-speeddating' }
    use { 'dhruvasagar/vim-table-mode' }
    use { 'mg979/vim-visual-multi', config = function() vim.g.VM_leader = ";" end }
    use { 'junegunn/vim-easy-align' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
    use { 'nacro90/numb.nvim', config = "require('plugins.numb')" }
    use { 'folke/todo-comments.nvim', config = "require('plugins.todo-comments')" }
    use { 'folke/zen-mode.nvim', config = "require('plugins.zen')", disable = not EcoVim.plugins.zen.enabled }
    use { 'folke/twilight.nvim', config = function() require("twilight").setup {} end,
      disable = not EcoVim.plugins.zen.enabled }
    use { 'ggandor/lightspeed.nvim', config = "require('plugins.lightspeed')" }
    use { 'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter" }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = "require('plugins.lualine')",
      event = "BufWinEnter"
    }
    use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' },
      config = "require('plugins.barbar')", branch = 'master' }
    use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
    use { 'rcarriga/nvim-notify', config = "require('plugins.notify')" }
    use { 'vuki656/package-info.nvim', event = "BufEnter package.json", config = "require('plugins.package-info')" }
    use { 'iamcco/markdown-preview.nvim', run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } }
    -- use { 'declancm/cinnamon.nvim', config = "require('plugins.cinnamon')" }
    use { 'karb94/neoscroll.nvim', config = "require('plugins.neoscroll')" }
    use { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end }
    use { 'Shatur/neovim-session-manager', config = "require('plugins.session-manager')" }
    use { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end }
    use { 'sunjon/shade.nvim', config = function() require("shade").setup(); require("shade").toggle(); end }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', config = "require('plugins.nvim-ufo')" }
    use { 'danilamihailov/beacon.nvim' }
    use { 'tpope/vim-abolish' }

    -- Snippets & Language & Syntax
    use { 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" }
    use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')" }
    use { 'NvChad/nvim-colorizer.lua', config = "require('plugins.colorizer')" }
    use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

    -- Git
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = "require('plugins.git.signs')",
      event = "BufRead"
    }
    use { 'sindrets/diffview.nvim', config = "require('plugins.git.diffview')" }
    use { 'akinsho/git-conflict.nvim', tag = "*", config = "require('plugins.git.conflict')" }
    use { 'ThePrimeagen/git-worktree.nvim', config = "require('plugins.git.worktree')" }
    use { 'kdheepak/lazygit.nvim' }

    -- Testing
    use {
      'rcarriga/neotest',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'haydenmeade/neotest-jest'
      },
      config = "require('plugins.neotest')"
    }

    -- DAP
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'mfussenegger/nvim-dap', config = "require('plugins.dap')" }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_path = compile_path,
    disable_commands = true,
    max_jobs = 50,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
