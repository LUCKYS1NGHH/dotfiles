function Linemode:size_mtime_type()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()

	local cha = self._file.cha
	local type_str
	if cha.is_dir then
		type_str = "dir"
	elseif cha.is_link then
		type_str = "lnk"
	elseif cha.is_exec then
		type_str = "exe"
	else
		type_str = "file"
	end

	return string.format("%s %s %s", type_str, size and ya.readable_size(size) or "-", time)
end
