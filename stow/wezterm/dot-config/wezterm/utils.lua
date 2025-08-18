local M = {}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function M.basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function M.merge_tables(destination, source)
	for key, value in pairs(source) do
		if type(value) == "table" and type(destination[key]) == "table" then
			M.merge_tables(destination[key], value)
		else
			destination[key] = value
		end
	end

	return destination
end

return M
