local options = {
	number = true,
	relativenumber = true,
	termguicolors = true,
	cmdheight = 0,
	completeopt = { "menuone", "noselect" },
	copyindent = true,
	cursorline = true,
	fileencoding = "utf-8",
	fillchars = { eob = " " },
	history = 200,
	ignorecase = true,
	laststatus = 3,
	lazyredraw = true,
	mouse = "a",
	preserveindent = true,
	pumheight = 10,
	scrolloff = 8,
	shiftwidth = 2,
	showmode = false,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	swapfile = false,
	tabstop = 2,
	timeoutlen = 300,
	undofile = true,
	updatetime = 300,
	wrap = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
