-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved
local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- enable plugins.trimwhitespace, otherwise it is disable by default:
config.plugins.trimwhitespace = true

config.tab_type = "soft" -- soft for spaces, hard for real tabs (\t)
config.indent_size = 4 -- 4 spaces
config.scroll_past_end = false
config.format_on_save = true

-- modify list of files to ignore when indexing the project:
config.ignore_files = {
	"^%.git$",
}

core.reload_module("colors.solarized-dark")

local fontconfig = require "plugins.fontconfig"
fontconfig.use_blocking {
	font = {
		name = "sans",
		size = 12 * SCALE,
	},
	code_font = {
		name = "Hack",
		size = 13 * SCALE,
	},
}
