
COLORS = {
	pink = "246;114;242",
	white = "252;247;248",
	orange = "243;66;19",
	blue = "55;114;255",
	green = "41;191;18",
}

function SET_COLOR(text, color)
	print(COLORS[color])
	if COLORS[color] ~= nil then
		return "\27[38;2;" .. COLORS[color] .. "m" .. text .. "\27[0m"
	else
		return text
	end
end
