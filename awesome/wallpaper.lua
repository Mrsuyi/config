local gears = require("gears")

-- config
local path = "/home/mrsuyi/wallpaper/"
local timeout = 1800 
math.randomseed(os.time())

function scandir(directory, filter)
    local i, t, popen = 0, {}, io.popen
    if not filter then
        filter = function(s) return true end
    end
    print(filter)
    for filename in popen('ls -a "'..directory..'"'):lines() do
        if filter(filename) then
            i = i + 1
            t[i] = filename
        end
    end
    return t
end

local index = 1
local filter = function(s) return string.match(s,"%.png$") or string.match(s,"%.jpg$") end
local files = scandir(path, filter)
local timer = timer { timeout = timeout }

timer:connect_signal("timeout", function()
 
  timer:stop()

  index = math.random( 1, #files)

  for s = 1, screen.count() do
    gears.wallpaper.maximized(path .. files[index], s, false)
  end
 
  timer.timeout = timeout
  timer:start()
end)

timer:emit_signal("timeout")

-- interfaces
module = {}

function module.next() 
    timer:emit_signal("timeout")
end

return module
