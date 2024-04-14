local pd <const> = playdate
local gfx <const> = playdate.graphics

class('CustomerUi').extends(gfx.sprite)

backgroundImage = gfx.nineSlice.new("images/gridBackground", 7, 7, 18, 18)
-- customerSprite = gfx.sprite.new()
block = gfx.geometry.rect.new()


function CustomerUi:init(x, y)
    backgroundImage:setCenter(0, 0)
    backgroundImage:moveTo(x, y)
    backgroundImage:add()
end
