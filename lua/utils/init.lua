---@diagnostic disable:undefined-global
require('utils.vimscript')

_G.my = {
  platform = {
    is_mac = jit.os == "OSX",
    is_linux = jit.os == "Linux",
    is_windows = jit.os == "Windows",
  },
  fs = require 'utils.fs',
  ui = require 'utils.ui',
  io = require 'utils.io',
  git = require 'utils.git',
  struc = require 'utils.table',
  color = require 'utils.color',
  fn = require 'utils.aucmd',
}
