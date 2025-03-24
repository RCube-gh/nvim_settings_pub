local M = {}

M.enable = function()
	vim.g.rainbow_delimiters = {
        strategy = {
            [''] = require('rainbow-delimiters').strategy['global'],
            vim = require('rainbow-delimiters').strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-delimiters',
            javascript = 'rainbow-delimiters',
        },
        highlight = {
            'myRainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'myRainbowDelimiterPink',
        },
        blacklist = {},
    }
end

M.disable = function()
    vim.g.rainbow_delimiters = { strategy = { [""] = function() end } } -- Disable strategy
end

return M

