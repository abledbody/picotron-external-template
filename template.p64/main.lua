--[[pod_format="raw",created="2025-05-21 04:11:58",modified="2025-05-21 04:11:59",revision=1]]
DATP = ""
if not include"src/game.lua" then
	cd("/projects/template")
	DATP = "template.p64/"
	include"src/game.lua"
end