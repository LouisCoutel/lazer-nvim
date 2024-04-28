---@type table<color, string> RGB color values formatted for ANSI SGR
COLORS = {
	pink = "246;114;242",
	white = "252;247;248",
	orange = "243;66;19",
	blue = "55;114;255",
	green = "41;191;18",
}

---@alias utility function

---Surround string with ANSI SGR arguments to apply color
---@type utility
---@param text string Text to color
---@param color string Color name to look up in COLORS table
---@return string text
function SET_COLOR(text, color)
	if COLORS[color] ~= nil then
		return "\27[38;2;" .. COLORS[color] .. "m" .. text .. "\27[0m"
	else
		return text
	end
end
