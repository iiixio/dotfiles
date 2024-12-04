local map = vim.keymap.set

map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")
map({ "n", "v", "i" }, "<M-Down>", "<cmd>MultipleCursorsAddDown<CR>")
map({ "n", "v", "i" }, "<M-Up>", "<cmd>MultipleCursorsAddUp<CR>")
map({ "n", "v" }, "H", "<S-Left>", { desc = "Move 1 word to the left" })
map({ "n", "v" }, "L", "<S-Right>", { desc = "Move 1 word to the right" })
map("n", "!", "<C-w>w")
map("n", "bd", "<cmd>bdel<CR>", { desc = "Delete current buffer" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Previous buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "Q", "<cmd>bd!<CR>", { desc = "Quit current buffer" })
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Go to reference" })
map({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code actions" })
map("n", "cd", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP code documentation" })
map("n", "c[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to previous diagnostic" })
map("n", "c]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to next diagnostic" })
map("v", "P", '"_dP', { desc = "Delete and paste" })
map("n", "U", "<cmd>UndotreeToggle<CR>", { desc = "Open undo history" })
map("n", "==", function()
	local c = vim.fn.getpos(".")
	local v = vim.fn.winsaveview()
	vim.cmd.normal("ggVG==")
	vim.fn.setpos(".", c)
	vim.fn.winrestview(v)
end, { desc = "Indent whole page" })
map("n", ";;", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", ";g", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", ";G", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
map("n", ";fm", "<cmd>Files<CR>", { desc = "Find files (Mini)" })
map("n", ";ft", "<cmd>Telescope find_files<CR>", { desc = "Find files (Telescope)" })
map("n", ";s", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })
map("n", ";b", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", ";r", function()
	require("grug-far").open({
		prefills = {
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Grug-Far" })
map("n", ";c", function()
	require("conform").format({ async = true })
end, { desc = "Code Format" })
map("n", ";v", "<cmd>VenvSelect<CR>", { desc = "Select Python virtual environment" })
map("n", ";i", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", { desc = "Toggle inlay hints" })
