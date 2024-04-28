local lfs = require("lfs")
VimOptions = {
	indent_size = 4,
	setexpand = false,
	inccomand = "nosplit",
}
VimOptions.__index = VimOptions

function VimOptions:create(indent_size, setexpand, inccommand)
	local opts = {}
	setmetatable(opts, VimOptions)
	opts.indent_size = indent_size
	opts.setexpand = setexpand
	opts.inccomand = inccommand
	return opts
end

function VimOptions:write()
	local init_f = io.open("init.lua", "a+")
	if init_f then
		io.output(init_f)
		io.write(
			"\n",
			"--- Indenting options\n",
			"vim.opt.shiftwidth = ",
			self.indent_size,
			"\n",
			"vim.opt.tabstop = ",
			self.indent_size,
			"\n",
			"vim.opt.softtabstop = ",
			self.indent_size,
			"\n",
			"--- Enable live substitution\n",
			"vim.opt.inccommand = ",
			"'",
			self.inccomand,
			"'",
			"\n"
		)
		if self.setexpand then
			io.write("vim.opt.setexpand = true\n")
		end
		io.close()
	end
end

VimWindowOptions = { relative = true, number = true }
VimWindowOptions.__index = VimWindowOptions

function VimWindowOptions:create(relative, number)
	local vim_wo = {}
	setmetatable(vim_wo, VimWindowOptions)
	vim_wo.relative = relative
	vim_wo.number = number
	return vim_wo
end

function VimWindowOptions:write()
	local init_f = io.open("init.lua", "a+")
	if init_f then
		io.output(init_f)
		io.write(
			"\n",
			"--- Display line numbers\n",
			"vim.wo.relativenumber = ",
			self.relative,
			"\n",
			"vim.wo.number = ",
			self.number,
			"\n"
		)
	end
end

