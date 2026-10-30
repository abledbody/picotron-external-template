--[[pod_format="raw",created="2025-05-21 04:11:58",modified="2025-05-21 04:11:59",revision=1]]
DATP = ""
if not fstat"src/main.lua" then
	local loc = fetch("loc.txt")
	if not loc or not fstat(loc .. "/src/main.lua") then
		print("If this cart is loaded in a development context, please run loc.lua to generate a loc.txt file.\nLoad the cart again once you've done so.\nIf this is a standalone cart, a mistake has been made, and the src directory is missing.")
		stop()
		return
	end
	
	DATP = pwd() .. "/"
	cd(loc)
end
include"src/main.lua"