
DOUBLE_PI = math.pi * 2
HALF_PI = math.pi / 2
QUARTER_PI = math.pi / 4

--- Camera basically works as a singleton

local camera = {
    position = lovr.math.newVec3(0,0,0),
    rotation = lovr.math.newVec3(0,0,0)
}

function camera:getPos()
    return self.position
end

function camera:getRot()
    return self.rotation
end

function camera:update()
    lovr.graphics.clear()
    lovr.graphics.origin()
    lovr.graphics.rotate(self.rotation.x, 1, 0, 0)
    lovr.graphics.rotate(self.rotation.y, 0, 1, 0)
    lovr.graphics.translate(self.position.x, self.position.y, self.position.z)
end

function camera:poll()

    local mouseDelta = mouse:getDelta()

    self.rotation.x = self.rotation.x + mouseDelta.y
    self.rotation.y = self.rotation.y + mouseDelta.x

    if self.rotation.y > DOUBLE_PI then
        self.rotation.y = self.rotation.y - DOUBLE_PI
    elseif self.rotation.y < 0 then
        self.rotation.y = self.rotation.y + DOUBLE_PI
    end

    if self.rotation.x > HALF_PI then
        self.rotation.x = HALF_PI
    elseif self.rotation.x < -HALF_PI then
        self.rotation.x = -HALF_PI
    end

    local forward = lovr.keyboard.isDown("w")
    local backward = lovr.keyboard.isDown("s")
    local left = lovr.keyboard.isDown("a")
    local right = lovr.keyboard.isDown("d")
    local up = lovr.keyboard.isDown("space")
    local down = lovr.keyboard.isDown("lshift")

    local addition = lovr.math.newVec3(0,0,0)

    -- Allow to cancel out
    if (forward) then
        addition.x = addition.x + math.sin(self.rotation.y)
        addition.z = addition.z - math.cos(self.rotation.y)
    end
    if (backward) then
        addition.x = addition.x - math.sin(self.rotation.y)
        addition.z = addition.z + math.cos(self.rotation.y)
    end
    if (right) then
        addition.x = addition.x + math.sin(self.rotation.y + HALF_PI);
        addition.z = addition.z - math.cos(self.rotation.y + HALF_PI);
    end
    if (left) then
        addition.x = addition.x - math.sin(self.rotation.y + HALF_PI);
        addition.z = addition.z + math.cos(self.rotation.y + HALF_PI);
    end

    if (up) then
        addition.y = addition.y + 1;
    end
    if (down) then
        addition.y = addition.y - 1;
    end

    addition.x = addition.x * lovr.timer.getDelta();
    addition.y = addition.y * lovr.timer.getDelta();
    addition.z = addition.z * lovr.timer.getDelta();

    self.position:add(addition)
end

return camera