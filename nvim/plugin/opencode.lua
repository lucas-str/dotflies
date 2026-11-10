local oc = require("opencode")

-- Disable permission and edit events
vim.g.opencode_opts = {
    events = {
        permissions = {
            enabled = false,
        },
    },
}

vim.keymap.set({ "n", "x" }, "<Leader>oa", function()
    oc.ask("@this: ")
end, { desc = "Ask OpenCode…" })
vim.keymap.set({ "n", "x" }, "<Leader>os", function()
    oc.select()
end, { desc = "Select OpenCode…" })

vim.keymap.set({ "n", "x" }, "<leader>on", function()
    local body = vim.json.encode({ location = { directory = vim.fn.getcwd() } })
    vim.system(
        { "opencode", "api", "post", "/api/session", "--data", body },
        {},
        vim.schedule_wrap(function()
            require("opencode").ask("@this: ")
        end)
    )
end, { desc = "OpenCode: new session + ask" })

vim.keymap.set({ "n", "x" }, "go", function()
    return oc.operator("@this")
end, { desc = "Send range to OpenCode", expr = true })
vim.keymap.set({ "n" }, "goo", function()
    return oc.operator("@this") .. "_"
end, { desc = "Send line to OpenCode", expr = true })
