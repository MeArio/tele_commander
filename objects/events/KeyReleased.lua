local KeyReleased = class('KeyReleased')

function KeyReleased:initialize(key)
    self.key = key
end

return KeyReleased