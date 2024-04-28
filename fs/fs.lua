local lfs = require("lfs")

function init_dir(dir_root_path, username)
	local cd = dir_root_path
	return pcall(function()
		lfs.chdir(cd)

		lfs.mkdir("nvim")
		lfs.chdir(cd .. "/nvim")

		cd = lfs.currentdir()
		io.output("init.lua")
		io.write("---<LAZER>")
		lfs.mkdir("lua")
		lfs.chdir(cd .. "/lua")

		cd = lfs.currentdir()
		lfs.mkdir(username)
		lfs.chdir(cd .. "/" .. username)

		cd = lfs.currentdir()
		lfs.mkdir("plugins")
		io.output("remap.lua")
		io.write("---<LAZER>")
		io.output("init.lua")
		io.write("---<LAZER>")
		lfs.chdir(dir_root_path)
	end)
end
