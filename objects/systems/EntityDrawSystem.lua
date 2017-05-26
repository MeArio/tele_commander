local EntityDrawSystem = class('EntityDrawSystem', System)

function EntityDrawSystem:initialize()
    System.initialize(self)
end

function EntityDrawSystem:draw()
    for _, entity in pairs(self.targets) do
        local pos = entity:get('Position')
        local image = entity:get('Sprite').image
        love.graphics.draw(image, pos.x, pos.y)
    end
end

function EntityDrawSystem:requires()
    return {'Position', 'Sprite'}
end

return EntityDrawSystem