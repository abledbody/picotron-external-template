--[[pod_format="raw",created="2025-05-21 04:11:58",modified="2025-05-21 04:11:59",revision=1]]
DATP = ""
if not fetch"src/game.lua" then
	cd("/projects/picotron-external-template")
	DATP = "template.p64/"
end
include"src/game.lua"