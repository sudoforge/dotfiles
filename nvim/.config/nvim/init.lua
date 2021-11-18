-- init.lua
--
-- This file is the entrypoint to my configuration, and exists to import other modules under the
-- lua/{,*} directories. Changes to settings should not be made here (except for ad-hoc testing);
-- instead, prefer adding or updating settings in the relevant module(s).
---------------------------------------------------------------------------------------------------

require("completion")
require("constants")
require("keys")
require("lsp")
require("options")
require("terminal")
