lovr.window = require "window.lovr-window"
camera = require "camera.camera"
mouse = require "input.mouse"
keyboard = require "input.keyboard"

function lovr.load()
    lovr.mouse.setRelativeMode(true);
end

function lovr.update(delta)

    mouse:update()

    camera:poll()

    if (lovr.keyboard.isDown("escape")) then
        lovr.event.quit()
    end
end


local distance = 5
function lovr.draw()
    camera:update()
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

    
end

function lovr.quit()
    print("Peace")
end