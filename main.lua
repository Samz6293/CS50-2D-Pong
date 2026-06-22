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

	largeFont = love.graphics.newFont("font.ttf", 32)
	smallFont = love.graphics.newFont("font.ttf", 8)
	-- defining fonts (loading them in memory)

	player1score = 0
	player2score = 0
	-- player scores

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

	love.graphics.clear(40 / 255, 45 / 255, 52 / 255, 1)
	-- sets color of the canvas, x/255 coz the functions expects floating value between 0 & 1

	love.graphics.setFont(largeFont)
	-- sets smallFont defined earlier

	love.graphics.print(tostring(player1score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2 - 80)
	love.graphics.print(tostring(player2score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 2 - 80)
	-- we are  using virtual width and height now for text placement

	--paddle 1
	love.graphics.rectangle("fill", 10, 10, 5, 20)
	--paddle 2
	love.graphics.rectangle("fill", VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 30, 5, 20)
	--ball
	love.graphics.rectangle("fill", VIRTUAL_WIDTH / 2 - 4, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
	--drawing rectangles and ball

	push.finish()
	-- end rendering at virtual resolution
end
