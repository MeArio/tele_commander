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
local Input = require 'objects.components.Input'
-- Systems go here
local EntityDrawSystem = require 'objects.systems.EntityDrawSystem'
local UserInputSystem = require 'objects.systems.UserInputSystem'
local MovementSystem = require 'objects.systems.MovementSystem'

-- Events
local eventManager = EventManager()
local KeyPressed = require 'objects.events.KeyPressed'
local KeyReleased = require 'objects.events.KeyReleased'

function love.load(arg)
    -- Entity
    ship = Entity()
    ship:add(Position:new())
    ship:add(Sprite:new('assets/sprites/ship.png'))
    ship:add(Input:new())
    ship:add(IsPlayer:new())

    -- Engine
    engine = Engine()
    engine:addEntity(ship)
    engine:addSystem(EntityDrawSystem:new(), 'draw')
    userInput = UserInputSystem:new()
    eventManager:addListener('KeyPressed', userInput, userInput.press)
    eventManager:addListener('KeyReleased', userInput, userInput.release)
    engine:addSystem(userInput, 'update')
    engine:addSystem(MovementSystem:new(), 'update')
end

function love.update(dt)
    engine:update(dt)
end

function love.draw()
    engine:draw()
end

function love.keypressed(key, isrepeat)
    eventManager:fireEvent(KeyPressed:new(key, isrepeat))
    print(key)
end

function love.keyreleased(key)
    eventManager:fireEvent(KeyReleased:new(key))
    print(key)
end

