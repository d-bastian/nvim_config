require("ibl").setup({
    debounce = 100,
    indent = {
        char = "▏",
        tab_char = { "a", "b", "c" },
        highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 2,
        repeat_linebreak = false,
    },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = { exclude = { language = { "lua" } } },
})
