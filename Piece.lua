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

function Piece:drop(tiles)
    for i, tile in pairs(tiles) do
        if isOnTile(self, tile) then
            self.x = tile.x - (self.img:getWidth()/2)
            self.y = tile.y - (self.img:getHeight()/2)
        end
    end
end

function isOnTile(t1, tile)
    return t1.x < tile.x+tile.size and
            tile.x < t1.x+t1.img:getWidth() and
           t1.y < tile.y+tile.size and
           tile.y < t1.y+t1.img:getHeight()
end
