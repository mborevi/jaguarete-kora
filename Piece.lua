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
    self.active = true
    self.x = love.mouse.getX() - (Piece.img:getWidth() / 2)
    self.y = love.mouse.getY() - (Piece.img:getHeight() / 2)
    for i, tile in pairs(tiles) do
        if self:isOnTile(self, tile) then
            tile.empty = true
        end
    end
end

function Piece:drop(tiles)
    for i, tile in pairs(tiles) do
        if self:isOnTile(self, tile) and tile.empty then
            self.x = tile.x - (self.img:getWidth()/2)
            self.y = tile.y - (self.img:getHeight()/2)
            tile.empty = false
        else
            
        end
    end
end

function Piece:isOnTile(t1, tile)
    if t1.x < tile.x+tile.size and tile.x < t1.x+t1.img:getWidth() and t1.y < tile.y+tile.size and tile.y < t1.y+t1.img:getHeight() then
        return true
    else
        return false
    end
end

function Piece:getActive()
    return self.active
end

function Piece:getTile(tiles)
    for i, tile in pairs(tiles) do
        if self:isOnTile() then
            return tile
        end
    end
end

function Piece:checkMoves(t, tiles)
    --nightmare
    moves = {
        {x = 0, y = 0},
        {x = 0, y = 0} 
    }
end

function Piece:findNearest(moves)
    nearest = {}
    n = 0
    c = 0
    for i, move in pairs(moves) do
        if self.x < move.x then --check > x and y
            c = self.x - move.x
            if (c < n) then
                n = c
            end
        end
    end
    
    return neareast
end

function Piece:moveTo(n)
    self.x = n.getX()
    self.y = n.geyY()
end