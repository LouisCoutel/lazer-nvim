require("ui.conditions")
require("ui.messages")
require("ui.colors")

---@class Prompt
---@field message string Formatted prompt message
---@field opts string[] List of valid choices
---@field condition function Checks user input and returns a code (0: valid/yes, 2: no, 3: invalid)
Prompt = { message = "", opts = { "(y)es", "(n)o" }, condition = YN_CONDITION }
Prompt.__index = Prompt

---@alias public function Public instance method

---@type public Create a new prompt
---@param text string Text to display
---@param opts? table	Valid choices to display
---@param condition? function Prompt check to use
---@return Prompt
function Prompt:create(text, opts, condition)
	local prompt = {}
	setmetatable(prompt, Prompt)
	prompt.message = CREATE_MSG(text, "blue")
	prompt.opts = opts
	prompt.condition = condition
	return prompt
end

---@type public Prompt until user input is valid and ouputs message
---@return integer code Prompt result code
function Prompt:ex()
	local choice = ""
	repeat
		io.write(self.message)
		for key, value in pairs(self.opts) do
			io.write(value .. " ")
		end
		io.write(LB)
		choice = io.read()
	until self.condition(choice) ~= 2
	if self.condition(choice) == 0 then
		io.write(CREATE_MSG("Moving forward...", "green"))
		return self.condition(choice)
	elseif self.condition(choice) == 1 then
		io.write(CREATE_MSG("Operation skipped", "orange"))
		return self.condition(choice)
	end
end
