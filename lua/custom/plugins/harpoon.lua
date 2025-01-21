return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", ",,a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", ",e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for id, ids in ipairs({ "a", "s", "d", "f", "g" }) do
			vim.keymap.set("n", string.format(",%s", ids), function()
				harpoon:list():select(id)
			end)
		end
	end,
}
