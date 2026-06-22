push = require("push")
--[[
push is a library that will allow us to draw our game at a virtual
resolution, instead of however large our window is; used to provide
 a more retro aesthetic
--]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()

--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
    love.graphics.setDefaultFilter("nearest", "nearest")
    -- uses nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text and graphics

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		resizable = false,
		vsync = true,
		fullscreen = false,
	})
    --initialize window

	push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = "normal" })
--[[
    initialize our virtual resolution, which will be
    rendered within our actual window no matter its dimensions
]]

end

function love.keypressed(key)

--[[
    Keyboard handling, called by LÖVE2D each frame;
    passes in the key we pressed so we can access it.
]]
	if key == "escape" then
		love.event.quit()
	end

end

function love.draw()

--[[
    Called after update by LÖVE2D, used to draw anything to the screen,
    updated or otherwise.
]]
	push.start()
    -- begin rendering at virtual resolution

	love.graphics.printf("Hello, PONG!!", 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, "center")
    -- we are now using virtual width and height now for text placement

	push.finish()
    -- end rendering at virtual resolution

end
