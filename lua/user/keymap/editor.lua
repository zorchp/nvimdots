local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

return {
	-- global moving for macro use `jk` as ESC
	["i|jk"] = map_cmd("<ESC>"):with_noremap():with_silent(),
	["v|jk"] = map_cmd("<ESC>"):with_noremap():with_silent(),
	-- select and change
	["n|cn"] = map_cmd("*``cgn"):with_noremap(),
	["n|cN"] = map_cmd("*``cgN"):with_noremap(),
	["n|<C-,>"] = map_cmd(":e ~/.config/nvim/lua/<CR>"):with_noremap():with_silent(),
	["i|<C-,>"] = map_cmd("<ESC>:e ~/.config/nvim/lua/<CR>"):with_noremap():with_silent(),
	["i|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Move cursor to right"),
	["i|<C-e>"] = map_cmd("<ESC>$a"):with_noremap():with_desc("edit: Move cursor to line start"),
	["i|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
	["i|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
}
