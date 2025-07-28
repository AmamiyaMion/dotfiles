#!/usr/bin/env lua
-- Dotfiles Management Helper
-- Dependencies: lua-toml (::luarocks) https://github.com/jonstoler/lua-toml
-- This program comes with ABSOLUTELY NO WARRANTY!
-- DO NOT USE THIS IN PRODUCTION ENVIRONMENT! 

-- GLOBAL VARIABLES
SUDO_COMMAND = "sudo"
-- end global variables

local toml = require "toml"
local config_file = io.open("dotfiles.toml", "r+")
if not config_file then
  print("WARN: config file `dotfiles.toml` does not exist. Creating. ")
  local new_config_file = io.open("dotfiles.toml", "w")
--- This ensures the config file `dotfiles.toml` exists. 
--- Therefore the VSCode check nil warning is ignored. 
--- @diagnostic disable-next-line: need-check-nil
  new_config_file:write("\n")
--- @diagnostic disable-next-line: need-check-nil
  new_config_file:close()
  config_file = io.open("dotfiles.toml", "r+")
end
assert(config_file, 
  "ERROR: Config file `dotfiles.toml` does not exist! \
  Note that it should be created before. Check file permissions. ")
local config_toml_string = config_file and config_file:read("*all") or nil
local config = toml.parse(config_toml_string)

local function file_operation(operation)
  assert(operation == "sync" or operation == "apply", 
    "ERROR: No operation given or invalid operation. \
    Avaliable operations: sync, apply")
  local function docopy(operation, v) 
    if operation == "sync" then
      os.execute((v.sudo and SUDO_COMMAND or "").." ".."cp "..v.file.." "..v.store)
      print("Copying "..v.file.." to "..v.store)
    elseif operation == "apply" then
      os.execute((v.sudo and SUDO_COMMAND or "").." ".."cp "..v.store.." "..v.file)
      print("Copying "..v.store.." to "..v.file)
    end
  end
  for k, v in pairs(config) do
    assert(v, "ERROR: Empty section! Check section ["..k.."] \
    in config file `dotfiles.toml`")
    assert(v.file, "ERROR: Key `file` not found in section ["..k.."]")
    assert(v.store, "ERROR: Key `store` not found in section ["..k.."]")
    docopy(operation, v)
  end
end
-- for k, v in pairs(arg) do
--   print(k, v, #arg, #table.pack(arg))
-- end
-- for k, v in pairs(table.pack(arg)) do
--   print(k, v)
-- end
if arg[1] == "sync" then
  file_operation("sync")
elseif arg[1] == "apply" then
  file_operation("apply")
end