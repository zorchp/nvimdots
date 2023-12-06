local custom = {}

custom["bluz71/vim-nightfly-colors"] = { -- add this
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = require("configs.nightfly"),
}
return custom