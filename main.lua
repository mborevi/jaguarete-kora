require "Piece"
require "Tile"
require "f"

function love.load(args)
    board = love.graphics.newImage('board.jpg')

    tiles = {}
    Tile:load(tiles)

    dogs = {}
	Piece:load(dogs, tiles)
end

function love.update(dt)
    for i, dog in pairs(dogs) do
        if dog.active then
            dog:grab(tiles)
		else	
			dog:drop(tiles)
        end
    end
end

function love.draw(dt)
    love.graphics.draw(board)
    for i, tile in pairs(tiles) do 
		love.graphics.circle("fill", tile.x, tile.y, tile.size)
		love.graphics.print(tostring(tile.empty), tile.x - 8, tile.y + 46, 0, 2, 2)
		love.graphics.print(tostring(tile.number), tile.x + 18, tile.y, 0, 2, 2)
	end
    for i, dog in pairs(dogs) do 
		love.graphics.draw(dog.img, dog.x, dog.y)
		love.graphics.print(tostring(dog.active), dog.x + 12, dog.y, 0, 2, 2)
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then
        for i, dog in pairs(dogs) do
		    if f:isMouseHovering(dog) then
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

