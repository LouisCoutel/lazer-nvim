local lfs = require"lfs"

COLORS = {pink = "246;114;242"}

function SET_COLOR(text, color)
	if COLORS[color] then
		return "\27[38;2;" .. COLORS[color] .."m" .. text
	else
		return text
	end
end

function DEC_OUT(output)
	return SET_COLOR("LAZER", "pink") .. " - " .. output
end

function PROMPT_PATH(request)
	io.output(io.stdout)
	repeat
		io.write(request)
		local answer = io.read()
	until lfs.chdir(answer)
	print("Moved to " .. lfs.currentdir())
end

function CREATE_DIRS()
	lfs.mkdir("nvim")
	lfs.chdir("./nvim")
	lfs.mkdir("lua")
	io.output("init.lua")
end

PROMPT_PATH(DEC_OUT("Please enter the path to your config directory:"))

