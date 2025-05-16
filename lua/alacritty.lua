local function readTheme(path)
	local lines = {}
	for line in io.lines(path) do
		lines[#lines + 1] = line
	end
	return lines
end

local function parseTheme(lines)
	local parsed = {}
	local lastSection = ""
	for _, line in pairs(lines) do
		local head = line:sub(1, 1)
		if head == "[" then
			-- line is a section header...
			local section = line:sub(2 + #"colors.", #line - 1)
			parsed[section] = {}
			lastSection = section
		elseif lastSection ~= "" and head ~= "#" and head ~= "" then
			local assignment = { line:match("(%a+)%s+= '?\"?(%#[%a%d]+)'?\"?") }
			parsed[lastSection][assignment[1]] = assignment[2]
		end
	end
	return parsed
end

function ReadAlacrittyTheme(path)
	return parseTheme(readTheme(path))
end
