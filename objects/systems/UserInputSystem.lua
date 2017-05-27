local UserInputSystem = class('UserInputSystem', System)

function UserInputSystem:initialize()
    System.initialize(self)
    self.keys = {}
    self.keys['a'] = 'moveLeft'
    self.keys['d'] = 'moveRight'
    self.keys['w'] = 'moveUp'
    self.keys['s'] = 'moveDown'
end

function UserInputSystem:update(dt)

end

function UserInputSystem:press(event)
    for _, entity in pairs(self.targets) do
        local input = entity:get('Input')
        input.inputs[self.keys[event.key]] = true
        print(input.inputs[self.keys[event.key]])
    end
end

function UserInputSystem:release(event)
    for _, entity in pairs(self.targets) do
        local input = entity:get('Input')
        input.inputs[self.keys[event.key]] = false
    end
end


function UserInputSystem:requires()
    return {'Position', 'IsPlayer', 'Input'}
end

return UserInputSystem