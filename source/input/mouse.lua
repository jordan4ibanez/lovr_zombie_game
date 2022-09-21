lovr.mouse = require "input.input_libraries.lovr-mouse"

-- Mouse basically works as a singleton
local mouse = {
    relative = true,
    delta = lovr.math.newVec2(0,0),
    first = true,
    sensitivity = 0.0001
}

function mouse:init()
    lovr.mouse.setPosition(0,0)
end

function mouse:update()
    if (self.first) then
        self:init()
        self.first = false
    end
    local x,y = lovr.mouse.getPosition()
    self.delta.x = x * self.sensitivity
    self.delta.y = y * self.sensitivity
    lovr.mouse.setPosition(0,0)
end

function mouse:getDelta()
    return self.delta
end


return mouse