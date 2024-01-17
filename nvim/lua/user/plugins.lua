-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Packer can manage itself
    { 'folke/tokyonight.nvim',               lazy = false, priority = 1000, opts = {} },
    "nvim-lualine/lualine.nvim",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- indentention lines
    'goolord/alpha-nvim',                                               -- startup page
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',                                             lazy = false },
    'nvimtools/none-ls.nvim',
    'petobens/poet-v',
    "lewis6991/gitsigns.nvim", -- Add git signs to gutter
    "TimUntersberger/neogit",  -- Magit clone for neovim
    { 'CRAG666/code_runner.nvim',        dependencies = { 'nvim-lua/plenary.nvim' } },
    { "numToStr/Comment.nvim",           dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" } },
    { "akinsho/bufferline.nvim",         dependencies = { "moll/vim-bbye" } }, -- don't close vim when closing last buffer
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('nvim-tree').setup {}
        end,
    },
}
local opts = {}
require("lazy").setup(plugins, opts)
