if vim.fn.has("wsl") == 1 then
    -- Paste issue with this.
    --vim.g.clipboard = "osc52"

    -- Same as above but paste normally.
    local function paste(_)
        return function(_)
            local content = vim.fn.getreg('"')
            return vim.split(content, "\n")
        end
    end
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = paste("+"),
            ["*"] = paste("*"),
        },
    }
end
