include"src/require.lua"

-------------------------------------Dependencies--------------------------------------



--------------------------------------Game State---------------------------------------

local game --- @type GameState

---@return GameState
local function new_game()
	--- @class GameState
	local gameState = {}
	return gameState
end

----------------------------------Picotron Callbacks-----------------------------------

function _init()
	game = new_game()
end

function _update()

end

function _draw()

end

include"src/error_explorer.lua"