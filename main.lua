require "Piece"
require "Tile"
require "f"

function love.load(args)
    board = love.graphics.newImage('board.jpg')

    tiles = {}
    Tile:load(tiles)

    dogs = {}
	Piece:load(dogs, tiles)

    jaguar =  Piece:new(love.graphics.newImage('jaguar.jpg'), tiles[30].x, tiles[30].y, false, true)
end

function love.update(dt)
    if jaguar.active then
        jaguar:grab(tiles)
    else
        jaguar:drop(tiles)
    end
    for i, dog in pairs(dogs) do
        if dog.active then --after dog is set active, all others should still be false
            dog:grab(tiles) 
            
		else	
            --dog.active = false
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
    love.graphics.draw(jaguar.img, jaguar.x, jaguar.y)
end

function love.mousepressed(x, y, button)
	if button == 1 then
        if f:isMouseHovering(jaguar) then
            jaguar.active = true
        end
        for i, dog in pairs(dogs) do
		    if f:isMouseHovering(dog) then
                dog.active = true
            end
        end
	end
end

function love.mousereleased()
    if jaguar.active then
        jaguar.active = false
    end
	for i, dog in pairs(dogs) do
        if dog.active then
		    dog.active = false
        end
	end
end


