--@diagnostic disable:undefined-global
require("global")
vim.api.nvim_set_var("mapleader", " ")
vim.api.nvim_set_var("maplocalleader", ",")

local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Auto install packer.nvim if not exists
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  _G.packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end

local packer = require("packer")
local packer_util = require("packer.util")

packer.reset()

packer.init({
  compile_path = packer_util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
  compile_on_sync = true,
  git = {
    clone_timeout = false,
  },
  display = {
    open_fn = packer_util.float,
  },
  max_jobs = 7,
  opt_default = false,
})

require("settings")

require("plugins")

require("lang")
require("keymappings")

require("config/colorschemes")
vim.cmd("colo themer_monokai")
