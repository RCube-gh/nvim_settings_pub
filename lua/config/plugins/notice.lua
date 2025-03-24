return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        win_options = {
            winhighlight = {
                Normal = "NormalFloat",
                FloatBorder = "FloatBorder",
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")

        -- Define the helper function to route messages to the mini view
        local function myMiniView(pattern, kind)
            kind = kind or ""  -- Default to empty string if no 'kind' is provided
            return {
                view = "mini",  -- Use the "mini" view for the matched messages
                filter = {
                    event = "msg_show",  -- Match messages of type 'msg_show'
                    kind = kind,         -- Match a specific kind of message (optional)
                    find = pattern,      -- Match the message based on the pattern
                },
            }
        end

        -- Set up noice.nvim with custom routes and filters
        noice.setup({
            messages = {
                view_search = "mini",  -- Set the view for search results to "mini"
            },
            routes = {
                {
                    -- Skip mode change messages like -- INSERT --
                    filter = {
                        event = "msg_showmode",
                        find = ".*--.*--",  -- Matches any mode indication (like -- INSERT --)
                    },
                    opts = { skip = true },  -- Skip these messages
                },
				{
					filter={
						event="msg_show",
						find="CopilotChat",
					},
					view="mini",
					--opts={skip=true},
				},
                -- {
                --     -- Skip messages like "written", "yanked", etc.
                --     filter = {
                --         event = "msg_show",
                --         find = ".*written.*",  -- Matches messages containing "written"
                --     },
                --     opts = { skip = true },  -- Skip these messages
                -- },
                -- {
                --     filter = {
                --         event = "msg_show",
                --         find = ".*yanked.*",  -- Matches messages containing "yanked"
                --     },
                --     opts = { skip = true },  -- Skip these messages
                -- },
                -- {
                --     filter = {
                --         event = "msg_show",
                --         find = ".*change;.*",  -- Matches messages related to "change"
                --     },
                --     opts = { skip = true },  -- Skip these messages
                -- },

                -- More filters for other messages as needed
                --myMiniView("Already at .* change"),
				myMiniView("written"),
				myMiniView("yanked"),
				--myMiniView("more lines?"),
				myMiniView("fewer lines?"),
				myMiniView("fewer lines?","lua_error"),
				--myMiniView("line less"),
				--myMiniView("lines indented"),
				myMiniView("change; before"),
				myMiniView("change; after"),
                myMiniView("No lines in buffer"),
                myMiniView("search hit .*, continuing at", "wmsg"),
                --myMiniView("E486: Pattern not found", "emsg"),
                -- myMiniView(".*CopilotChat.*"),
            },
        })
    end,
}

