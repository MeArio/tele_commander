local Sprite = class("Sprite")

function Sprite:initialize(imagePath)
    self.image = love.graphics.newImage(imagePath)
end

return Sprite