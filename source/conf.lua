function lovr.conf(settings)

    settings.identity = "LOVR Zombie Game"

    -- Window
    settings.window.width = 1280
    settings.window.height = 720
    settings.window.resizeable = true
    settings.window.fullscreen = false
    settings.window.msaa = 0
    settings.window.title = "LOVR Zombie Game 0.0.0"
    --settings.window.icon = "path here"
    settings.window.vsync = true
    settings.window.x = nil			-- The x-coordinate of the window's position in the specified display (number)
    settings.window.y = nil			-- The y-coordinate of the window's position in the specified display (number)
    settings.window.minwidth = 100			-- Minimum window width if the window is resizable (number)
    settings.window.minheight = 100			-- Minimum window height if the window is resizable (number)
    settings.window.display = 1			-- Index of the monitor to show the window in (number)
    settings.window.centered = true		-- Align window on the center of the monitor (boolean)
    settings.window.topmost = false		-- Show window on top (boolean)
    settings.window.borderless = true		-- Remove all border visuals from the window (boolean)
    settings.window.resizable = true		-- Let the window be user-resizable (boolean)
    settings.window.opacity = 1			-- Window opacity value (number)

    -- Modules
    settings.modules.headset = false
    settings.modules.audio = true
    settings.modules.data = true
    settings.modules.event = true
    settings.modules.filesystem = true
    settings.modules.graphics = true
    settings.modules.math = true
    settings.modules.physics = true
    settings.modules.system = true
    settings.modules.thread = true
    settings.modules.timer = true

end