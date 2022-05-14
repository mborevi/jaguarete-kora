Tile = {
    x = 20, 
    y = 16, 
    size = 16, 
    empty = true, 
    number = 0
}

function Tile:new(x, y)
    obj = {x = x - (self.size/2), y = y - (self.size/2), size = self.size, empty = self.empty}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Tile:load(tiles)
	hSpace = 0
	vSpace = 0
	for r = 0, 4 do
		for c = 0, 4 do
			table.insert(tiles, {x = self.x + hSpace, y = self.y + vSpace, size = self.size, empty = self.empty})
			hSpace = hSpace + 128
		end
		hSpace = 0
		self.x = 20
		vSpace = vSpace + 128
	end
	hSpace = hSpace + 128
	for c = 0, 2 do 
		table.insert(tiles, {x = self.x + hSpace, y = self.y + vSpace, size = self.size, empty = self.empty})
		hSpace = hSpace + 128
	end
	vSpace = vSpace + 128
	hSpace = 0
	self.x = 20
	for c = 0, 2 do
		table.insert(tiles, {x = self.x + hSpace, y = self.y + vSpace, size = self.size, empty = self.empty})
		hSpace = hSpace + 256
	end

    for i, tile in pairs(tiles) do
        tile.number = i
    end
end