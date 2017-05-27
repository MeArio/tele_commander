local MovementSystem = class('MovementSystem', System)

function MovementSystem:initialize()
    System.initialize(self)
    self.speed = 100
end

function MovementSystem:update(dt)
    for _, entity in pairs(self.targets) do
        local input = entity:get('Input').inputs
        local pos = entity:get('Position')
        if input['moveRight'] == true then
            pos.x = pos.x + self.speed * dt
        end
        if input['moveLeft'] == true then
            pos.x = pos.x - self.speed * dt
        end
        if input['moveUp'] == true then
            pos.y = pos.y - self.speed * dt
        end
        if input['moveDown'] == true then
            pos.y = pos.y + self.speed * dt
        end
    end
end

function MovementSystem:requires()
    return {'Position', 'Input'}
end

return MovementSystem