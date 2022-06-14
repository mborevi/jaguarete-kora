Piece = {
    img = "",
    x = 0,
    y = 0,
    lastTile = {},
    active = false,
    alive = true,
    canDrop = false
}

function Piece:new(img, x, y, active, alive, tile)
    obj = {img = img, x = x - (40), y = y - (40), active = active, alive = alive}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Piece:load(piece, tiles)
    --dogImgs = {'dog.png', 'dog0.png'}
    for i, tile in pairs(tiles) do
        if i > 16 and i < 32 then
            --newPiece = Piece:new(love.graphics.newImage(dogImgs[math.random(#dogImgs)]), tile.x, tile.y, false, true)
            newPiece = Piece:new(love.graphics.newImage('dog.png'), tile.x, tile.y - 40, false, true)
            table.insert(piece, newPiece)
        end
    end
end

function Piece:grab(tiles)
    self.active = true
    self.x = love.mouse.getX() - (self.img:getWidth() / 2)
    self.y = love.mouse.getY() - (self.img:getHeight() / 2) - 20
    for i, tile in pairs(tiles) do
        if self:isOnTile(self, tile) then
            self.lastTile = tile
            tile.empty = true
        end
    end
    self.canDrop = true
end

function Piece:drop(tiles)
    if self.canDrop then
        for i, tile in pairs(tiles) do
            if self:isOnTile(self, tile) and tile.empty then
                self.x = tile.x - (self.img:getWidth()/2)
                self.y = tile.y - (self.img:getHeight()/2)
                self.lastTile = tile
                tile.empty = false
            else  
                self.x = self.lastTile.x - (self.img:getWidth()/2)
                self.y = self.lastTile.y - (self.img:getHeight()/2) - 22
            end
        end
        self.canDrop = false
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