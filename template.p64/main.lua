--[[pod_format="raw",created="2025-05-21 04:11:58",modified="2025-05-21 04:11:59",revision=1]]
DATP = ""
if not fstat"src/main.lua" then
	local loc = fetch("loc.txt")
	if not loc then
		print("Please run the loc.lua file to generate a loc.txt")
		stop()
		return
	end
	
	if not fstat(loc .. "/src/main.lua") then
		print("loc.txt does not point to a valid cart. Please run the loc.lua file to generate a new one.")
		stop()
		return
	end
	
	DATP = pwd() .. "/"
	cd(loc)
end
include"src/main.lua"