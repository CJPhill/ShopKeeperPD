local pd <const> = playdate
local gfx <const> = playdate.graphics

class('ListUi').extends(gfx.sprite)

local gridviewImage = gfx.image.new(200, 100)

local gridview = pd.ui.gridview.new(0, 32)
local weapons = { "knife", "parrot", "shield", "turkey leg", "tester", "sword", "staff", "turtle", "bear" }

gridview:setNumberOfRows(#weapons)
gridview:setCellPadding(2, 2, 2, 2)

gridview.backgroundImage = gfx.nineSlice.new("images/gridBackground", 7, 7, 18, 18)
gridview:setContentInset(5, 5, 5, 5)
gridviewSprite = gfx.sprite.new()


function ListUi:init(x, y)
    gridviewSprite:setCenter(0, 0)
    gridviewSprite:moveTo(x, y)
    gridviewSprite:add()
end

function gridview:drawCell(section, row, column, selected, x, y, width, height)
    if selected then
        gfx.fillRoundRect(x, y, width, height, 4)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    else
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
    end
    local fontHeight = gfx.getSystemFont():getHeight()
    gfx.drawTextInRect(weapons[row], x, y + (height / 2 - fontHeight / 2) + 2, width, height, nil, nil,
        kTextAlignment.center)
end

function ListUi:checks()
    local crankTicks = pd.getCrankTicks(2)
    if crankTicks == 1 then
        gridview:selectNextRow(true)
    elseif crankTicks == -1 then
        gridview:selectPreviousRow(true)
    end

    if gridview.needsDisplay then
        local gridviewImage = gfx.image.new(100, 240)
        gfx.pushContext(gridviewImage)
        gridview:drawInRect(0, 0, 100, 240)
        gfx.popContext()
        gridviewSprite:setImage(gridviewImage)
    end
end
