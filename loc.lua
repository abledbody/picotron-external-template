local file_names = ls()
local p64s = {}
for _, file_name in ipairs(file_names) do
	if file_name:match(".+%.p64$") then
		add(p64s, file_name)
	end
end

if #p64s != 1 then
	print("Could not identify the .p64 to add a loc.txt file to. One has been created in this directory.\nPlease move it to the appropriate .p64 folder.")
	store("loc.txt", pwd())
	return
end

local loc_path = ("%s/%s/loc.txt"):format(pwd(), p64s[1])
store(loc_path, pwd())
print(loc_path .. " generated.")