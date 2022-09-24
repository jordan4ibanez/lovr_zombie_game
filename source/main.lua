lovr.window = require "window.lovr-window"
camera = require "camera.camera"
mouse = require "input.mouse"
keyboard = require "input.keyboard"
require "math"
require "helpers.lua_switch"

local ground
local ball
local pill

function lovr.load()
    lovr.mouse.setRelativeMode(true);

    world = lovr.physics.newWorld()
    world:setLinearDamping(0.01)
    world:setAngularDamping(0.005)

    -- Create the ground
    ground = world:newBoxCollider(0, 0, 0, 50, .05, 50)
    ground:setKinematic(true)
    ground:setFriction(10)

    ball = world:newSphereCollider(1,20,3, 0.2)

    pill = world:newCapsuleCollider(0,3,-2, 0.25, 0.5)
    pill:setOrientation(0.25, 1, 1, 1)
    


    -- Create boxes!
    boxes = {}

    for x = -1, 1, .25 do
        for y = .125, 2, .24999 do
            local box = world:newBoxCollider(x, y, -2 - y / 5, .25)
            box:setFriction(10)
            table.insert(boxes, box)
        end
    end

    lovr.timer.step() -- Reset the timer before the first update

end

function lovr.update(delta)

    world:update(delta)

    mouse:update()

    camera:poll()

    if (lovr.keyboard.isDown("escape")) then
        lovr.event.quit()
    end
end

local shapeSwitch = switch:new({
    BoxShape = function(inputTable)
        local collider = inputTable[1];
        local shape    = inputTable[2];
        local x, y, z  = collider:getPosition()
        local sizeX, sizeY, sizeZ = shape:getDimensions();
        local angle, rotX, rotY, rotZ = collider:getOrientation();
        lovr.graphics.box(
            "fill",
            x,
            y,
            z,
            sizeX,
            sizeY,
            sizeZ,
            angle,
            rotX,
            rotY,
            rotZ
        );
    end;
    SphereShape = function(inputTable)
        local collider = inputTable[1];
        local shape    = inputTable[2];
        local x, y, z  = collider:getPosition();
        local radius   = shape:getRadius();
        local angle, rotX, rotY, rotZ = collider:getOrientation();
        lovr.graphics.sphere(
            x,
            y,
            z,
            radius,
            angle,
            rotX,
            rotY,
            rotZ
        );
    end;
    CapsuleShape = function(inputTable)
        local collider = inputTable[1];
        local shape    = inputTable[2];
        local x, y, z  = collider:getPosition();
        local radius   = shape:getRadius();
        local length   = shape:getLength();
        local angle, rotX, rotY, rotZ = collider:getOrientation();
        lovr.graphics.cylinder(
            x,
            y,
            z,
            length,
            angle,
            rotX,
            rotY,
            rotZ,
            radius,
            radius,
            false
        );
    end
})

-- A helper function for drawing boxes
local function drawCollisionBox(collider)
    for _, shape in pairs(collider:getShapes()) do
        shapeSwitch:match(tostring(shape), {collider, shape})
    end

    --[[ local minx, maxx, miny, maxy, minz, maxz = box:getAABB()
    local x, y, z = box:getPosition()
    lovr.graphics.box(
        "fill",
        x, y, z,
        math.abs(minx) + math.abs(maxx),
        math.abs(miny) + math.abs(maxy),
        math.abs(minz) + math.abs(maxz),
        0.25,
        box:getOrientation()
    )
    ]]-- 
end

local distance = 5
function lovr.draw()
    camera:update()

    lovr.graphics.setColor(0, 1,0.5,1)
    drawCollisionBox(ground)

    for i, box in ipairs(boxes) do
        lovr.graphics.setColor(i / 72,0,0,1)
        drawCollisionBox(box)
    end

    drawCollisionBox(pill)

    drawCollisionBox(ball)

    --[[
    lovr.graphics.setColor(255,255,255,255)
    lovr.graphics.print('hello world', 0, 1.7, -3, .5)
    lovr.graphics.print("hi there")

    lovr.graphics.setColor(255,255,255,255)
    lovr.graphics.box("fill", 0, distance, 0, 1, 1, 1, 0, 0, 0, 0)
    lovr.graphics.setColor(0,255,255,255)
    lovr.graphics.box("fill", 0, -distance, 0, 1, 1, 1, 0, 0, 0, 0)

    lovr.graphics.setColor(0,0,255,255)
    lovr.graphics.box("fill", distance, 0, 0, 1, 1, 1, 0, 0, 0, 0)
    lovr.graphics.setColor(255,0,255,255)
    lovr.graphics.box("fill", -distance, 0, 0, 1, 1, 1, 0, 0, 0, 0)

    lovr.graphics.setColor(0,255,255,255)
    lovr.graphics.box("fill", 0, 0, distance, 1, 1, 1, 0, 0, 0, 0)
    lovr.graphics.setColor(255,255,0,255)
    lovr.graphics.box("fill", 0, 0, -distance, 1, 1, 1, 0, 0, 0, 0)
    ]]--

end

function lovr.quit()
    print("Peace")
end