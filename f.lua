f = {}
function f:isMouseHovering(t)
	return t.x < love.mouse.getX() and
	love.mouse.getX() < t.x +t.img:getWidth() and
		   t.y < love.mouse.getY() and
		   love.mouse.getY() < t.y+t.img:getHeight()
end

function f:distance ( t1, t2 )
	local dx = t1.x - t2.x
	local dy = t1.y - t2.y
	return math.sqrt ( dx * dx + dy * dy )
  end