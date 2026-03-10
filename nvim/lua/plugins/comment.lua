return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = 'gcc',  -- Keymapping for line comments
                    block = 'gcb',  -- Keymapping for block comments
                },
                opleader = {
                    line = 'gc',  -- Keymapping for line comment in operator-pending mode
                    block = 'gb', -- Keymapping for block comment in operator-pending mode
                },
                mappings = {
                    basic = true,  -- Enable basic keymaps (e.g., 'gcc')
                    extra = true,  -- Enable extra keymaps (e.g., 'gcO')
                    extended = false,  -- Enable extended keymaps (if needed)
                },
                extra = {
                    above = 'gcO',  -- Comment above the current line (normal mode)
                    below = 'gco',  -- Comment below the current line (normal mode)
                    eol = 'gca',    -- Comment at the end of the line (normal mode)
                },
            })  -- Setup the plugin
        end,
        opts = {
        -- add any options here
        }
    }
}
