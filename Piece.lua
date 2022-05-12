
Piece = {
    img = love.graphics.newImage('dog.jpg'),
    x = 0,
    y = 0,
    active = false,
    alive = true
}

function Piece:new(x, y, active, alive)
    obj = {x = x - (Piece.img:getWidth()/2), y = y - (Piece.img:getHeight()/2), active = active, alive = alive}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Piece:grab()
    self.x = love.mouse.getX() - (Piece.img:getWidth() / 2)
    self.y = love.mouse.getY() - (Piece.img:getHeight() / 2)
end