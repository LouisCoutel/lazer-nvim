require("ui.colors")

LAZERTAG = SET_COLOR("<LAZER> ", "pink")
LB = "\n"

function CREATE_MSG(text, text_color)
	local body = SET_COLOR(text, text_color)
	return LAZERTAG .. body .. LB
end
