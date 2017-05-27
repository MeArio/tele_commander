local Input = class('Input')

function Input:initialize()
    self.inputs = {}
    self.inputs['moveRight'] = false;
    self.inputs['moveLeft'] = false;
    self.inputs['moveUp'] = false;
    self.inputs['moveDown'] = false;
end

return Input