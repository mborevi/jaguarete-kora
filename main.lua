require "Piece"
local dog = nil

function love.load(args)
    board = love.graphics.newImage('board.jpg')

    tiles = {}
    startTiles(tiles)

    dogs = {}

    for i, tile in pairs(tiles) do
        if i < 16 then
            newDog = Piece:new(tile.x, tile.y, false, true)
            table.insert(dogs, newDog)
        end
    end
end

function love.update(dt)
    for i, dog in pairs(dogs) do
        if dog.active then
            dog:grab()
		else	
			dog:drop(tiles)
        end
    end
end

function love.draw(dt)
    love.graphics.draw(board)
    for i, tile in pairs(tiles) do 
		love.graphics.circle("fill", tile.x, tile.y, tile.size)
	end
    for i, dog in pairs(dogs) do 
		love.graphics.draw(dog.img, dog.x, dog.y)
		love.graphics.print(tostring(dog.active), dog.x + 12, dog.y, 0, 2, 2)
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then
        for i, dog in pairs(dogs) do
		    if isMouseHovering(dog) then
                dog.active = true
            end
        end
	end
end

function love.mousereleased()
	for i, dog in pairs(dogs) do
		dog.active = false
	end
end

function isMouseHovering(t)
	return t.x < love.mouse.getX() and
	love.mouse.getX() < t.x +t.img:getWidth() and
		   t.y < love.mouse.getY() and
		   love.mouse.getY() < t.y+t.img:getHeight()
end

function startTiles(tiles)
	startTile = {x = 20, y = 16, size = 16, occupied = false}
	hSpace = 0
	vSpace = 0
	for r = 0, 4 do
		for c = 0, 4 do
			table.insert(tiles, {x = startTile.x + hSpace, y = startTile.y + vSpace, size = startTile.size, occupied = startTile.occupied})
			hSpace = hSpace + 128
		end
		hSpace = 0
		startTile.x = 20
		vSpace = vSpace + 128
	end
	hSpace = hSpace + 128
	for c = 0, 2 do 
		table.insert(tiles, {x = startTile.x + hSpace, y = startTile.y + vSpace, size = startTile.size, occupied = false})
		hSpace = hSpace + 128
	end
	vSpace = vSpace + 128
	hSpace = 0
	startTile.x = 20
	for c = 0, 2 do
		table.insert(tiles, {x = startTile.x + hSpace, y = startTile.y + vSpace, size = startTile.size})
		hSpace = hSpace + 256
	end
end