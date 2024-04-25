
function YN_CONDITION(input)
	if input == ("y" or "Y" or "yes" or 0) then
		return 0
	elseif input == ("n" or "N" or "no" or 1) then
		return 1
	else
		return 2
	end
end
