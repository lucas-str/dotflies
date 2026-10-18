local oc = require("opencode")

vim.keymap.set({ "n", "x" }, "<Leader>oa", function()
    oc.ask("@this: ")
end, { desc = "Ask OpenCode…" })
vim.keymap.set({ "n", "x" }, "<Leader>os", function()
    oc.select()
end, { desc = "Select OpenCode…" })

vim.keymap.set({ "n", "x" }, "go", function()
    return oc.operator("@this")
end, { desc = "Send range to OpenCode", expr = true })
vim.keymap.set({ "n" }, "goo", function()
    return oc.operator("@this") .. "_"
end, { desc = "Send line to OpenCode", expr = true })
