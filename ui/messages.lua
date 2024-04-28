require("ui.colors")

---@type string
---@see SET_COLOR
LAZERTAG = SET_COLOR("<LAZER>", "pink") .. ": "

LB = "\n"

--- Add app tag and line break to string and set text color
---@type utility
---@param text string Text to format
---@param text_color string Color to apply
---@return string message Formatted and colored message
function CREATE_MSG(text, text_color)
	local body = SET_COLOR(text, text_color)
	return LAZERTAG .. body .. LB
end
