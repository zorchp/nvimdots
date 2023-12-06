-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = true

settings["use_copilot"] = false
settings["format_notify"] = false
settings["transparent_background"] = true
settings["colorscheme"] = "nightfly"
settings["treesitter_deps"] = {
	"java",
}
settings["lsp_deps"] = {
	-- "gopls",
}

return settings
