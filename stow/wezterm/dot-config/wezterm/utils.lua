local M = {}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function M.basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function M.append_arrays(destination, source)
	for _, item in ipairs(source) do
		table.insert(destination, item)
	end
end

function M.merge_tables(destination, source)
	for key, value in pairs(source) do
		if type(value) == "table" and type(destination[key]) == "table" then
			local is_array = #value > 0

			if is_array then
				M.append_arrays(destination[key], value)
			else
				M.merge_tables(destination[key], value)
			end
		else
			destination[key] = value
		end
	end
end

return M
