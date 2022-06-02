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

function Piece:load(piece, tiles)
    for i, tile in pairs(tiles) do
        if i < 16 then
            newPiece = Piece:new(tile.x, tile.y, false, true)
            table.insert(piece, newPiece)
        end
    end
end

function Piece:grab(tile)
    self.x = love.mouse.getX() - (Piece.img:getWidth() / 2)
    self.y = love.mouse.getY() - (Piece.img:getHeight() / 2)
    for i, tile in pairs(tiles) do
        if isOnTile(self, tile) then
            tile.empty = true
            currentTile = tiles[i].number
            if currentTile+5 < 32 then
                tiles[currentTile+5].number = 666
                tiles[currentTile+6].number = 666
                tiles[currentTile+4].number = 666ll
            end
        end
    end
end

function Piece:drop(tiles)
    for i, tile in pairs(tiles) do
        if isOnTile(self, tile) and tile.empty then
            self.x = tile.x - (self.img:getWidth()/2)
            self.y = tile.y - (self.img:getHeight()/2)
            tile.empty = false
        else
            
        end
    end
end

function Piece:isOnTile(t1, tile)
    return t1.x < tile.x+tile.size and
            tile.x < t1.x+t1.img:getWidth() and
           t1.y < tile.y+tile.size and
           tile.y < t1.y+t1.img:getHeight()
end

function Piece:canMoveTo(tiles) 
    for i, tile in pairs(tiles) do
        if self:isOntile(self, tile) then
            if then 
            end
        else
    end
end
