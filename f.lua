f = {}
function f:isMouseHovering(t)
	return t.x < love.mouse.getX() and
	love.mouse.getX() < t.x +t.img:getWidth() and
		   t.y < love.mouse.getY() and
		   love.mouse.getY() < t.y+t.img:getHeight()
end