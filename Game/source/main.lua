-- CoreLibs
import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/sprites"
import "CoreLibs/nineslice"
import "CoreLibs/crank"

-- libraries
import "scripts/libraries/AnimatedSprite"

--Files
import "scripts/listUi"
-- import "scripts/customerUi"

local pd <const> = playdate
local gfx <const> = playdate.graphics

ListUi(300, 0)
--local customer = CustomerUi(0, 0)
--customer:add()

function makeSprite()
	local rectSprite = gfx.sprite.new()
	rectSprite:setSize(400, 240)
	function rectSprite:draw()
		gfx.drawRect(0, 0, 300, 150)
	end

	rectSprite:setCenter(0, 0)
	rectSprite:moveTo(2, 2)
	rectSprite:setZIndex(3)
	rectSprite:add()
end

makeSprite()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	ListUi:checks()
	--gfx.setDrawOffset(0, 0)
end
