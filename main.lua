require "Piece"
require "Tile"
require "f"

function love.load(args)
    board = love.graphics.newImage('assets/board.png')

    tiles = {}
    Tile:load(tiles)

    dogs = {}
	Piece:load(dogs, tiles)

    jaguar =  Piece:new(love.graphics.newImage('assets/jaguar.png'), tiles[2].x, tiles[2].y, false, true)
end

function love.update(dt)
    if jaguar.active then
        jaguar:grab(tiles)
    else
        jaguar:drop(tiles)
    end
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
    --for i, tile in pairs(tiles) do 
	--	love.graphics.print(tostring(tile.empty), tile.x - 8, tile.y + 46, 0, 2, 2)
	--end
    for i, dog in pairs(dogs) do 
		love.graphics.draw(dog.img, dog.x, dog.y)
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


