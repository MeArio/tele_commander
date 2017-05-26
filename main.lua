-- entity component system

local lovetoys = require ('libs.lovetoys.lovetoys')
lovetoys.initialize({
    globals = true,
    debug = true --Entity, System, Engine, Component, EventManager, class global
})

-- Components go here
local IsPlayer = require 'objects.components.IsPlayer'
local Position = require 'objects.components.Position'
local Sprite = require 'objects.components.Sprite'

-- Systems go here
    local EntityDrawSystem = require 'objects.systems.EntityDrawSystem'

function love.load()

    -- Entity
    ship = Entity()
    ship:add(Position:new())
    ship:add(Sprite:new('assets/sprites/ship.png'))

    -- Engine
    engine = Engine()
    engine:addEntity(ship)
    engine:addSystem(EntityDrawSystem:new(), 'draw')
end

function love.update(dt)

end

function love.draw()
    engine:draw()
end

function love.keypressed(key, isrepeat)

end
