return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			result = {
				focus_result = false,
				window_options = {
					signcolumn = "no",
				},
			},
		})

		vim.keymap.set("n", "db", require("dbee").toggle, { desc = "Toggle DBee" })
	end,
}
