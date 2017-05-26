local lovetoys = require ('libs.lovetoys.lovetoys')
lovetoys.initialize({
    globals = true,
    debug = true --Entity, System, Engine, Component, EventManager, class global
})

function love.load()
    sprite = love.graphics.newImage('assets/sprites/ship.png')
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(sprite, 0,0)
end

function love.keypressed(key, isrepeat)

end
