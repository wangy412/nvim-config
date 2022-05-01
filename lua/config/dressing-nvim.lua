require("dressing").setup {
    input = {
        prefer_width = 0.4,
        min_width = { 40 },
        winblend = 0,
        -- winhighlight = "NormalFloat:Normal",
        -- ^ decided to just change the actual NormalFloat
    },
    select = {
        telescope = require("telescope.themes").get_dropdown(),
    },
}
