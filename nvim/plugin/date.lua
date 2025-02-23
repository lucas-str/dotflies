local function get_day_fr(dt)
    local days = { "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi" }
    return days[dt.wday]
end

local function get_month_fr(dt)
    local days = {
        "Janvier",
        "Février",
        "Mars",
        "Avril",
        "Mai",
        "Juin",
        "Juillet",
        "Août",
        "Septembre",
        "Octobre",
        "Novembre",
        "Décembre",
    }
    return days[dt.month]
end

vim.api.nvim_create_user_command("Date", function()
    local dt = os.date("*t")
    local fmt = get_day_fr(dt) .. " %d " .. get_month_fr(dt) .. " %Y %H:%M"
    local datestr = os.date(fmt)
    local line = vim.api.nvim_get_current_line()
    local nline = datestr .. line
    vim.api.nvim_set_current_line(nline)
end, { desc = "Insert date to current line" })
