-- nvim-treesitter's archived master branch expects its query handlers to get one
-- node per capture, but Neovim 0.12 always passes a list of nodes. Reload those
-- handlers through a wrapper that hands them the last node, as `all = false` did.
local function fix_query_handlers()
    if vim.fn.has("nvim-0.12") == 0 then
	return
    end

    local query = vim.treesitter.query
    local add_directive, add_predicate = query.add_directive, query.add_predicate

    local function single_node(add)
	return function(name, handler, opts)
	    add(name, function(match, ...)
		local nodes = setmetatable({}, {
		    __index = function(_, id)
			local captured = match[id]
			return captured and captured[#captured]
		    end,
		})
		return handler(nodes, ...)
	    end, opts)
	end
    end

    query.add_directive, query.add_predicate = single_node(add_directive), single_node(add_predicate)
    package.loaded["nvim-treesitter.query_predicates"] = nil
    require("nvim-treesitter.query_predicates")
    query.add_directive, query.add_predicate = add_directive, add_predicate
end

return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    config = function()
	local config = require("nvim-treesitter.configs")
	fix_query_handlers()
	config.setup ({
	    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
	    ensure_installed = { "c","cpp" ,"java", "python", "bash", "rust", 
				"html", "css", "javascript", "typescript", "tsx",
				"lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

	    -- Install parsers synchronously (only applied to `ensure_installed`)
	    sync_install = false,

	    -- Automatically install missing parsers when entering buffer
	    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	    auto_install = true,

	    -- List of parsers to ignore installing (or "all")
	    -- ignore_install = { "javascript" },

	    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	    highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	    },
	})
    end
}
